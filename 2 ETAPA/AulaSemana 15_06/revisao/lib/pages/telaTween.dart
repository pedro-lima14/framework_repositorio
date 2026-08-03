import 'package:flutter/material.dart';

class TelaTween extends StatefulWidget {
  const TelaTween({super.key});

  @override
  State<TelaTween> createState() => _TelaTweenState();
}

class _TelaTweenState extends State<TelaTween> {
  double tamanhoFinal = 120;

  void alterarTamanho() {
    setState(() {
      tamanhoFinal = tamanhoFinal == 120 ? 260 : 120;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(
                  begin: 120,
                  end: tamanhoFinal,
                ),
                duration: const Duration(seconds: 1),
                builder: (context, valor, child) {
                  return Container(
                    width: valor,
                    height: valor,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Tween',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: alterarTamanho,
                child: const Text('Alterar tamanho com Tween'),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Tween define um valor inicial e um valor final. O Flutter calcula os valores intermediários automaticamente.',
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
