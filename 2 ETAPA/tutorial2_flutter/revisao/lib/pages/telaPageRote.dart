import 'package:flutter/material.dart';

class TelaPageRoute extends StatelessWidget {
  const TelaPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageRoute'),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
const Icon(
  Icons.open_in_new,
  size: 80,
  color: Colors.purple,
),

const SizedBox(height: 20),

const Text(
  'PageRouteBuilder',
  style: TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  ),
  textAlign: TextAlign.center,
),

const SizedBox(height: 10),

const Text(
  'Permite personalizar a animação de abertura de uma nova tela.',
  textAlign: TextAlign.center,
),


],
          ),
        ),
      ),
    );
  }
}