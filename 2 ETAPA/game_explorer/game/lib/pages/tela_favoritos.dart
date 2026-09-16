import 'package:flutter/material.dart';

class TelaFavoritos extends StatelessWidget {
  const TelaFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: Text("Minecraft"),
            subtitle: Text("Sandbox"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: Text("FIFA"),
            subtitle: Text("Esporte"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: Text("GTA V"),
            subtitle: Text("Aventura"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}