import 'package:flutter/material.dart';

import '../widgets/botao_desafio.dart';

import '../widgets/card_desafio.dart';
import 'tela_perfil.dart';

class TelaInicio extends StatefulWidget {
  const TelaInicio({super.key});

  @override
  State<TelaInicio> createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  final List<Map<String, String>> desafios = [
    {
      'nome': 'Derrote o dragao',
      'dificuldade': 'Dificil',
      'pontos': '75',
      'imagem': 'assets/Smoke_and_Mirrors_album_cover.jpeg',
    },
     {
      'nome': 'Derrote o sapo',
      'dificuldade': 'Fácil',
      'pontos': '20',
      'imagem': 'assets/Smoke_and_Mirrors_album_cover.jpeg',
    },
     {
      'nome': 'Derrote o urso',
      'dificuldade': 'Médio',
      'pontos': '90',
      'imagem': 'assets/Smoke_and_Mirrors_album_cover.jpeg',
    },
  ];

  int indiceAtual = 0;
  bool tocando = false;
  int volume = 5;

  void playPause() {
    setState(() {
      tocando = !tocando;
    });
  }

  void proximaMusica() {
    setState(() {
      indiceAtual++;

      if (indiceAtual >= desafios.length) {
        indiceAtual = 0;
      }

      tocando = false;
    });
  }

  void musicaAnterior() {
    setState(() {
      indiceAtual--;

      if (indiceAtual < 0) {
        indiceAtual = desafios.length - 1;
      }

      tocando = false;
    });
  }

  void aumentarVolume() {
    if (volume < 10) {
      setState(() {
        volume++;
      });
    }
  }

  void diminuirVolume() {
    if (volume > 0) {
      setState(() {
        volume--;
      });
    }
  }

  void abrirInformacoes() {
    final desafio = desafios[indiceAtual];

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Detalhes do desafio',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                desafio['nome']!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text('Dificuldade: ${desafio['dificuldade']}'),
              Text('Pontuação: ${desafio['pontos']}'),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Fechar'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final desafio = desafios[indiceAtual];

    final larguraTela = MediaQuery.of(context).size.width;

    final bool telaGrande = larguraTela >= 700;

    final double tamanhoCapa = telaGrande ? 380 : 280;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafios'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TelaPerfil();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  width: tocando ? tamanhoCapa : tamanhoCapa - 15,
                  height: tocando ? tamanhoCapa : tamanhoCapa - 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 25,
                        offset: Offset(0, 12),
                        color: Colors.black45,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      desafio['imagem']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  desafio['nome']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  desafio['dificuldade']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: tocando ? 0.55 : 0.25,
                  minHeight: 5,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BotaoPlayer(
                      icone: Icons.skip_previous,
                      aoClicar: musicaAnterior,
                    ),
                    const SizedBox(width: 25),
                    BotaoPlayer(
                      icone: tocando ? Icons.block : Icons.check,
                      aoClicar: playPause,
                      principal: true,
                    ),
                    const SizedBox(width: 25),
                    BotaoPlayer(
                      icone: Icons.skip_next,
                      aoClicar: proximaMusica,
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                
                OutlinedButton.icon(
                  onPressed: abrirInformacoes,
                  icon: const Icon(
                    Icons.info_outline,
                  ),
                  label: const Text(
                    'Mais informações',
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
