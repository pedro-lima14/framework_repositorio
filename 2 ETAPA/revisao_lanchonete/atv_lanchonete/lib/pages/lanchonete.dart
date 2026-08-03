import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../widgets/area_produtos.dart';
import '../widgets/resumo_pedido.dart';
import 'tela_pedido.dart';

class TelaResponsiva extends StatelessWidget {
  const TelaResponsiva({super.key});

  void _mostrarPromocao(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.local_offer, size: 40, color: Colors.orange),
              const SizedBox(height: 10),
              const Text(
                'Promoção do dia!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Na compra de um X-Burguer, o suco sai pela metade do preço!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;

    final produtos = [
      Produto(Icons.fastfood, 'Cachorro quente full', 'Monte do seu jeito!', 'R\$ 20'),
      Produto(Icons.breakfast_dining, 'Batatas cromadas', 'Grandes batatas para você e seu grupo', 'R\$ 40'),
      Produto(Icons.lunch_dining, 'X-tudo pro max', 'O mais completo da região', 'R\$ 35'),
      Produto(Icons.icecream, 'Casquinha', 'Sorvete artesanal com calda de chocolate quente.', 'R\$ 4'),
      Produto(Icons.local_drink, 'Suco Natural Turbo', 'Suco de laranja gelado para refrescar.', 'R\$ 12'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lanchonete Express'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final largura = constraints.maxWidth;

          final celular = largura < 600;
          final tablet = largura >= 600 && largura < 900;
          final desktop = largura >= 900;

          final colunas = celular ? 1 : tablet ? 2 : 3;
          final alturaCard = celular ? 230.0 : tablet ? 220.0 : 210.0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Boas vindas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _mostrarPromocao(context),
                      child: const Text('Ver promoção'),
                    ),
                    const SizedBox(width: 10),
                    FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TelaPedido()),
                        );
                      },
                      child: const Text('Fazer Pedido'),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                if (desktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: AreaProdutos(
                          produtos: produtos,
                          colunas: colunas,
                          alturaCard: alturaCard,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        flex: 1,
                        child: ResumoPedido(),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      AreaProdutos(
                        produtos: produtos,
                        colunas: colunas,
                        alturaCard: alturaCard,
                      ),
                      const SizedBox(height: 20),
                      const ResumoPedido(),
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
