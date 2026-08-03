import 'package:flutter/material.dart';
import 'package:revisao/pages/telaAnimatedContainer.dart';

class TelaDetalhes extends StatelessWidget {
  const TelaDetalhes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animação'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(//scroll do safeArea
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(
                  Icons.school,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Animação implícita e explícita',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Escolha um tipo de animação.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TelaAnimatedContainer();
                        },
                      ), // MaterialPageRoute
                    );
                  },
                  icon: const Icon(Icons.animation),
                  label: const Text('AnimatedContainer'),
                ), // ElevatedButton.icon
                ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TelaPageRoute();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.open_in_new),
                label: const Text('PageRoute'),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
