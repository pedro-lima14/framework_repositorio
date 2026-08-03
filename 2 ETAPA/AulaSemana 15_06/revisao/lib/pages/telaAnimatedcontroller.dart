import 'package:flutter/material.dart';

class TelaAnimationController extends StatefulWidget {
  const TelaAnimationController({super.key});

  @override
  State<TelaAnimationController> createState() {
    return _TelaAnimationControllerState();
  }
}

class _TelaAnimationControllerState extends State<TelaAnimationController>
    with SingleTickerProviderStateMixin {//ajuda o flutter a controlar a animação de froma eficiente
  late AnimationController controller;//controla a animação
  late Animation<double> tamanho;//controla o tamanho

  @override
  void initState() {//executa quando a tela é aberta
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,//ajuda a animacao rodar com melhor desempenho
    );

    tamanho = Tween<double>(//define o valor inicial e final
      begin: 100,
      end: 250,
    ).animate(controller);//liga o tween a controller
  }

  @override
  void dispose() {//é executado quando a tela é fechada
    controller.dispose();//libera o controller da memoria
    super.dispose();
  }

  void iniciarAnimacao() {
    controller.forward();//inicia a animação
  }

  void voltarAnimacao() {
    controller.reverse();//volta a animacao
  }

  void reiniciarAnimacao() {
    controller.forward(from: 0);//reinicia/ reseta a animação
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimationController'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(//reconstroi o widget enquanto a animação acontece
                animation: tamanho,
                builder: (context, child) {//bilder constroi o que vai aparecer na tela
                  return Container(
                    width: tamanho.value,
                    height: tamanho.value,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Animação',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: iniciarAnimacao,
                child: const Text('Iniciar animação'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: voltarAnimacao,
                child: const Text('Voltar animação'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: reiniciarAnimacao,
                child: const Text('Reiniciar animação'),
              ),
              const SizedBox(height: 20),
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
