import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pokemon_provider.dart';
import 'tela_detalhes_pokemon.dart';

class TelaPokemon extends StatefulWidget {
  const TelaPokemon({
    super.key,
  });

  @override
  State<TelaPokemon> createState() {
    return _TelaPokemonState();
  }
}

class _TelaPokemonState extends State<TelaPokemon> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> pesquisar() async {
    final nome = controller.text.trim();

    if (nome.isEmpty) {
      return;
    }

    await context.read<PokemonProvider>().pesquisarPorNome(
      nome,
    );
  }

  Future<void> pokemonAleatorio() async {
    final pokemon = await context
        .read<PokemonProvider>()
        .carregarAleatorio();

    if (!mounted || pokemon == null) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TelaDetalhesPokemon(
            idPokemon: pokemon['id'],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PokemonProvider>();

    final pokemonPesquisado = provider.pokemonSelecionado;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokédex',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) {
                pesquisar();
              },
              decoration: InputDecoration(
                labelText: 'Pesquisar Pokémon',
                hintText: 'Ex: pikachu',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(
                    Icons.clear,
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: provider.carregando
                    ? null
                    : pesquisar,
                child: const Text(
                  'Pesquisar',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: provider.carregando
                    ? null
                    : pokemonAleatorio,
                icon: const Icon(
                  Icons.casino,
                ),
                label: const Text(
                  'Pokémon Aleatório',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (provider.carregando)
              const CircularProgressIndicator(),
            if (!provider.carregando && provider.erro != null)
              Text(
                provider.erro!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            if (!provider.carregando &&
                provider.erro == null &&
                pokemonPesquisado != null)
              Card(
                child: ListTile(
                  leading: Image.network(
                    pokemonPesquisado['imagem'],
                    width: 60,
                  ),
                  title: Text(
                    pokemonPesquisado['nome']
                        .toString()
                        .toUpperCase(),
                  ),
                  subtitle: Text(
                    'Tipo: ${pokemonPesquisado['tipo']}',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TelaDetalhesPokemon(
                            idPokemon: pokemonPesquisado['id'],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            if (!provider.carregando)
              Expanded(
                child: ListView.builder(
                  itemCount: provider.pokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = provider.pokemons[index];

                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          pokemon['imagem'],
                          width: 60,
                        ),
                        title: Text(
                          pokemon['nome']
                              .toString()
                              .toUpperCase(),
                        ),
                        subtitle: Text(
                          'Tipo: ${pokemon['tipo']}',
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TelaDetalhesPokemon(
                                  idPokemon: pokemon['id'],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
