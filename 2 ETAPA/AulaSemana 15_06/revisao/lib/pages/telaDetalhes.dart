import 'package:flutter/material.dart';
import 'package:revisao/pages/telaAnimatedContainer.dart';
import 'package:revisao/pages/telaAnimatedOpacity.dart';
import 'package:revisao/pages/telaAnimatedcontroller.dart';
import 'package:revisao/pages/telaPageRoute.dart';
import 'package:revisao/pages/telaTween.dart';

class TelaDetalhes extends StatelessWidget {
  const TelaDetalhes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animações'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                    'Animações implícitas e explícitas',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Escolha uma animação.',
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
                        ),
                      );
                    },
                    icon: const Icon(Icons.animation),
                    label: const Text('AnimatedContainer'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const TelaAnimatedOpacity();
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.visibility),
                    label: const Text('AnimatedOpacity'),
                  ),
                  const SizedBox(height: 10),
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
                    icon: const Icon(Icons.pages),
                    label: const Text('Page Route animated'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const TelaTween();
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.animation),
                    label: const Text('Tween'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const TelaAnimationController();
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.control_camera),
                    label: const Text('Animation controler'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
