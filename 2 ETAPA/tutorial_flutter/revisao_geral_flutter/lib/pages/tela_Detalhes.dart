import 'package:flutter/material.dart';

class TelaDetalhes extends StatelessWidget{
  //mudar de estado
  const TelaDetalhes({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.info,
                size: 80,
                color: Colors.amber,
              ),
              const SizedBox(height: 20),
              
              const Text(
                "Voce chegou na segunda tela",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              
              const Text(
                "Essa tela foi aberta usando Navigator.push",
                
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: (){
                  Navigator.pop(context);//volta para pagina anterior
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
                )
            ],
          ),
          ) 
      ),

    );
  }
}