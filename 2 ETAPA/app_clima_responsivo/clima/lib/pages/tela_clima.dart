import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';
import '../widgets/area_cidades.dart';
import '../widgets/painel_informacoes.dart';

class TelaClima extends StatelessWidget {
  const TelaClima({super.key});

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;

    final cidades = [
      CidadeClima(Icons.wb_sunny, 'Belo Horizonte', 28, 'Ensolarado'),
      CidadeClima(Icons.beach_access, 'Curitiba', 17, 'Chuvoso'),
      CidadeClima(Icons.cloud, 'São Paulo', 22, 'Nublado'),
      CidadeClima(Icons.local_fire_department, 'Rio de Janeiro', 32, 'Quente'),
      CidadeClima(Icons.ac_unit, 'Porto Alegre', 14, 'Frio'),
      CidadeClima(Icons.air, 'Natal', 29, 'Vento Forte'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima Agora'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final largura = constraints.maxWidth;

          final celular = largura < 600;
          final tablet = largura >= 600 && largura < 900;
          final desktop = largura >= 900;

          final colunas = celular ? 1 : tablet ? 2 : 3;
          
          final dispositivoTexto = celular ? 'Celular' : tablet ? 'Tablet' : 'Desktop';
          
          final cidadesFiltradas = celular ? cidades.take(4).toList() : cidades;

          final alturaCard = celular ? 230.0 : tablet ? 220.0 : 210.0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Largura atual: ${larguraTela.toStringAsFixed(0)} px | Dispositivo: $dispositivoTexto',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: celular ? 16 / 9 : 16 / 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: FittedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Clima Agora',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Confira as condições do tempo em diversas cidades.',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Categorias',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Chip(label: Text('Ensolarado')),
                    Chip(label: Text('Chuvoso')),
                    Chip(label: Text('Frio')),
                    Chip(label: Text('Quente')),
                    Chip(label: Text('Nublado')),
                    Chip(label: Text('Vento Forte')),
                  ],
                ),
                const SizedBox(height: 25),
                if (tablet) ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade100,
                      ),
                      child: const Text('Ver previsão para 7 dias'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                if (desktop) ...[
                  const Row(
                    children: [
                      Icon(Icons.av_timer, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        'Dados climáticos atualizados em tempo real.',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
                if (desktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: AreaCidades(
                          cidades: cidadesFiltradas,
                          colunas: colunas,
                          alturaCard: alturaCard,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        flex: 1,
                        child: PainelInformacoes(),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      AreaCidades(
                        cidades: cidadesFiltradas,
                        colunas: colunas,
                        alturaCard: alturaCard,
                      ),
                      const SizedBox(height: 20),
                      const PainelInformacoes(),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
