import 'package:flutter/material.dart';

import 'card_jogo.dart';
import 'tela_perfil.dart';
import 'tela_favoritos.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Explorer"),
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 35,
                    child: Icon(
                      Icons.sports_esports,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Game Explorer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Explore o mundo dos games!",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Início"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Perfil"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaPerfil(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Favoritos"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaFavoritos(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                Icons.sports_esports,
                size: 100,
              ),
              SizedBox(height: 16),

              Text(
                'Bem-vindo ao Game Explorer!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Explore jogos, descubra novas aventuras e organize seus conteúdos favoritos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 30),

              CardJogo(
                icone: Icons.explore,
                titulo: 'Explorar',
                descricao: 'Descubra novos jogos, mundos e personagens.',
              ),

              SizedBox(height: 12),

              CardJogo(
                icone: Icons.favorite,
                titulo: 'Favoritos',
                descricao: 'Organize os jogos que você mais gosta.',
              ),

              SizedBox(height: 12),

              CardJogo(
                icone: Icons.emoji_events,
                titulo: 'Conquistas',
                descricao: 'Acompanhe seus desafios e recompensas.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}