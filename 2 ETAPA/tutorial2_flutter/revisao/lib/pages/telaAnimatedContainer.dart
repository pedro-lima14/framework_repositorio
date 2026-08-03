import 'package:flutter/material.dart';

class TelaAnimatedContainer extends StatefulWidget {
  const TelaAnimatedContainer({super.key});

  @override
  State<TelaAnimatedContainer> createState() => _TelaAnimatedContainerState();
}

class _TelaAnimatedContainerState extends State<TelaAnimatedContainer> {
  bool expandido = false; //variavel booleana
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ), // AppBar
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'AnimatedContainer',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ), // TextStyle
                textAlign: TextAlign.center,
              ), // Text
              const SizedBox(height: 10),
              const Text(
                'Clique no card para animar tamanho, cor e borda.',
                textAlign: TextAlign.center,
              ), // Text
              const SizedBox(height: 30),
              GestureDetector(
                //detectar quando o usuario aperta algo na tela
                onTap: () {
                  //ao clicar na tela no limite do container, a animação irá acontecer
                  setState(() {
                    expandido = !expandido;
                  });
                },
                child: AnimatedContainer( // É um container qe anma automaticamnete quando alguma propriedade muda
                  duration: const Duration(seconds: 1), //duração do tempo que a animação vai durar
                  width: expandido ? 300 : 130,
                  //Se expandido for verdadeiro o valor é de 300(true)
                  //Se expandido for falso o valor é 130 (false)
                  height: expandido ? 300 : 130,
                  decoration: BoxDecoration(
                    color: expandido ? Colors.blue : Colors.orange,
                    borderRadius: BorderRadius.circular(
                      expandido ? 30 : 10,
                    ), // BorderRadius.circular
                  ), // BoxDecoration
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          expandido ? Icons.check_circle : Icons.touch_app,
                          color: Colors.white,
                          size: 40,
                        ), // Icon
                        const SizedBox(height: 10),
                        const Text(
                          'Clique',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ), // TextStyle
                        ), // Text
                      ],
                    ), // Column
                  ), // Center
                ), // AnimatedContainer
              ), // GestureDetector
            ],
          ), // Column
        ), // Padding
      ), // SafeArea
    ); // Scaffold
  }
}


