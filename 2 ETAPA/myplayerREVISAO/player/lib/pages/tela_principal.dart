import 'package:flutter/material.dart';

class TelaMissao extends StatefulWidget {
  const TelaMissao({super.key});

  @override
  State<TelaMissao> createState() => _TelaMissaoState();
}

class _TelaMissaoState extends State<TelaMissao> {
  bool status = false;
  String texto = "";
  
  // O volume inicia em 5
  int volume = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player musical'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.music_note,
                  size: 80,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Música: Camisa 10',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Artista: Turma do pagode',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  texto = status ? "Reproduzir" : "Pausado",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() => status = !status);
                  },
                  icon: status ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
                  label: status ? const Text("Reproduzir") : const Text("Pausar"),
                ),
                
                const SizedBox(height: 40),
                
                volume == 0
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.volume_off, color: Colors.red),
                          SizedBox(width: 8),
                          Text(
                              fontSize: 15, 
                            'Sem som',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        'Volume: $volume',
                        style: const TextStyle(
                          fontSize: 14, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                const SizedBox(height: 15),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        if (volume > 0) {
                          setState(() => volume--);
                        }
                      },
                      child: const Text('Volume -'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {

                        if (volume < 10) {
                          setState(() => volume++);
                        }
                      },
                      child: const Text('Volume +'),
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
