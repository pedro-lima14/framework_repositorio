import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final Map<String, dynamic> voo;

  const DetalhesPage({
    super.key,
    required this.voo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do voo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    child: Icon(
                      Icons.flight,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    voo['identificacao'] ?? 'Voo não identificado',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            _Informacao(
              titulo: 'Categoria',
              valor: voo['categoria'],
              icone: Icons.category,
            ),

            _Informacao(
              titulo: 'Tipo de aeronave',
              valor: voo['tipo_aeronave'],
              icone: Icons.airplanemode_active,
            ),

            _Informacao(
              titulo: 'Local',
              valor: voo['local'],
              icone: Icons.location_on,
            ),

            _Informacao(
              titulo: 'Partida',
              valor: voo['partida'],
              icone: Icons.flight_takeoff,
            ),

            _Informacao(
              titulo: 'Chegada',
              valor: voo['chegada'],
              icone: Icons.flight_land,
            ),
          ],
        ),
      ),
    );
  }
}

class _Informacao extends StatelessWidget {
  final String titulo;
  final dynamic valor;
  final IconData icone;

  const _Informacao({
    required this.titulo,
    required this.valor,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icone),
        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          valor?.toString().isNotEmpty == true
              ? valor.toString()
              : 'Não informado',
        ),
      ),
    );
  }
}