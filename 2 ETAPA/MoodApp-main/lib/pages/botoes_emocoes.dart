import 'package:flutter/material.dart';

class TelaEmocoes extends StatefulWidget {
  const TelaEmocoes({super.key});

  @override
  State<TelaEmocoes> createState() => _TelaEmocoesState();
}

class _TelaEmocoesState extends State<TelaEmocoes> {
  String humor = '';
  bool mostrarMensagem = false;
  String mensagem = '';

  Color cor = Colors.grey;
  IconData icone = Icons.sentiment_neutral;
  String texto = 'Escolha um humor';

  void selecionarHumor(String novoHumor) {
    setState(() {
      humor = novoHumor;
      mostrarMensagem = true;

      if (humor == 'Feliz') {
        cor = const Color.fromARGB(255, 3, 95, 3);
        icone = Icons.sentiment_satisfied;
        texto = 'Hoje estou feliz!';
        mensagem = 'Você esta alegre';
      } else if (humor == 'Triste') {
        cor = Colors.blue;
        icone = Icons.sentiment_dissatisfied;
        texto = 'Estou tiste!';
        mensagem = 'Você esta chorando';
      } else if (humor == 'Raiva') {
        cor = const Color.fromARGB(255, 255, 0, 0);
        icone = Icons.dangerous_rounded;
        texto = 'Estou bravo!';
        mensagem = 'Você esta bravo';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mood App')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                const Text(
                  'Mood App',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Escolha seu humor e veja a a acontecer!',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                
                Center(
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: cor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icone, size: 60, color: Colors.white),
                      const SizedBox(height: 10),
                      Text(
                        texto,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                ),

                const SizedBox(height: 20),

                
                AnimatedOpacity(
                  opacity: mostrarMensagem ? 1 : 0,
                  duration: const Duration(seconds: 2),
                  child: Column(
                    children: [
                      Text(
                        'Você escolheu: $humor',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        mensagem,
                        textAlign: TextAlign.center,),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => selecionarHumor('Feliz'),
                      child: const Text('Feliz'),
                    ),
                    ElevatedButton(
                      onPressed: () => selecionarHumor('Triste'),
                      child: const Text('Triste'),
                    ),
                    ElevatedButton(
                      onPressed: () => selecionarHumor('Raiva'),
                      child: const Text('Raiva'),
                    ),
                  ],
                ),
              ],
            
            ),
          ),
        ),
      ),
    );
  }
}