import 'package:flutter/material.dart';
// CORREÇÃO: Ajustado o nome do arquivo para bater com a árvore de arquivos (D maiúsculo)
import 'package:revisao/pages/tela_Detalhes.dart';

class TelaRevisao extends StatefulWidget {
  const TelaRevisao({super.key});

  @override
  State<TelaRevisao> createState() => _TelaRevisaoState();
}

class _TelaRevisaoState extends State<TelaRevisao> {
  String mensagem = 'Clique em uma opção';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revisão Flutter"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.phone_android,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Revisão de Flutter',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Vamos revisar widgets, layout, estilo, botões, estado e navegação.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              
              // Exibição da mensagem que muda com o estado
              Text(
                mensagem,
                style: const TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey
                ),
              ),
              const SizedBox(height: 15),
              
              // Botão para interagir com o estado da tela
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    mensagem = "Estado alterado com sucesso!";
                  });
                },
                child: const Text("Interagir"),
              ),
              const SizedBox(height: 20),

              // Botão para avançar para a próxima tela
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaDetalhes(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Avançar para Detalhes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
