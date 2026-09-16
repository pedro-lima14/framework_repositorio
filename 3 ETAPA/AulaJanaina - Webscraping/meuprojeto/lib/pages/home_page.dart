import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/voo_provider.dart';
import 'detalhes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _aeroportoController =
      TextEditingController(text: 'SBGR');

  String _tipoSelecionado = 'chegadas';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _buscarVoos();
    });
  }

  @override
  void dispose() {
    _aeroportoController.dispose();
    super.dispose();
  }

  void _buscarVoos() {
    final aeroporto = _aeroportoController.text.trim().toUpperCase();

    if (aeroporto.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Digite um código ICAO válido com 4 letras.',
          ),
        ),
      );
      return;
    }

    context.read<VooProvider>().buscarVoos(
          aeroporto: aeroporto,
          tipo: _tipoSelecionado,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RaspaVoo'),
        centerTitle: true,
      ),
      body: Consumer<VooProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Consulta de voos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Informe o aeroporto e o tipo de voo.',
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: _aeroportoController,
                  textCapitalization: TextCapitalization.characters,
                  maxLength: 4,
                  decoration: const InputDecoration(
                    labelText: 'Código ICAO',
                    hintText: 'Ex.: SBGR',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.flight),
                    counterText: '',
                  ),
                ),

                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  initialValue: _tipoSelecionado,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de voo',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'chegadas',
                      child: Text('Chegadas'),
                    ),
                    DropdownMenuItem(
                      value: 'partidas',
                      child: Text('Partidas'),
                    ),
                    DropdownMenuItem(
                      value: 'todos',
                      child: Text('Todos'),
                    ),
                  ],
                  onChanged: (valor) {
                    if (valor == null) return;

                    setState(() {
                      _tipoSelecionado = valor;
                    });
                  },
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: provider.carregando ? null : _buscarVoos,
                    icon: const Icon(Icons.search),
                    label: const Text('BUSCAR VOOS'),
                  ),
                ),

                const SizedBox(height: 20),

                if (provider.carregando)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (provider.erro != null)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 60,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            provider.erro!,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _buscarVoos,
                            child: const Text('Tentar novamente'),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: provider.voos.isEmpty
                        ? const Center(
                            child: Text(
                              'Nenhum voo encontrado.',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${provider.voos.length} voo(s) encontrado(s)',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Expanded(
                                child: ListView.builder(
                                  itemCount: provider.voos.length,
                                  itemBuilder: (context, index) {
                                    final voo = provider.voos[index];

                                    return Card(
                                      margin: const EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child: ListTile(
                                        leading: const CircleAvatar(
                                          child: Icon(Icons.flight),
                                        ),
                                        title: Text(
                                          voo['identificacao'] ??
                                              'Voo sem identificação',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${voo['categoria'] ?? 'N/A'}\n'
                                          '${voo['local'] ?? 'Local não informado'}',
                                        ),
                                        isThreeLine: true,
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetalhesPage(
                                                voo: voo,
                                              ),
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
              ],
            ),
          );
        },
      ),
    );
  }
}