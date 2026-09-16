import 'package:flutter/material.dart';

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Jogador 1",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Pontuação"),
              subtitle: Text("2450 pontos"),
            ),
            ListTile(
              leading: Icon(Icons.games),
              title: Text("Jogos concluídos"),
              subtitle: Text("18"),
            ),
            ListTile(
              leading: Icon(Icons.emoji_events),
              title: Text("Conquistas"),
              subtitle: Text("32"),
            ),
          ],
        ),
      ),
    );
  }
}