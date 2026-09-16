import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/produto.dart';
import '../providers/produto_provider.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({super.key});

  @override
  State<EstoquePage> createState() {
    return _EstoquePageState();
  }
}

class _EstoquePageState extends State<EstoquePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<ProdutoProvider>(
        context,
        listen: false,
      ).carregarProdutos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final produtoProvider =
        Provider.of<ProdutoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ESTOQUE',
        ),
      ),
      body: produtoProvider.produtos.isEmpty
          ? const Center(
              child: Text(
                'Nenhum produto cadastrado.',
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: produtoProvider.produtos.length,
              itemBuilder: (context, index) {
                final produto =
                    produtoProvider.produtos[index];

                return _produtoCard(
                  context,
                  produto,
                  produtoProvider,
                );
              },
            ),
    );
  }

  Widget _produtoCard(
    BuildContext context,
    Produto produto,
    ProdutoProvider provider,
  ) {
    final estoqueBaixo = produto.quantidade <= 3;

    return Card(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              produto.nome,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            Text(
              produto.categoria,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            Text(
              'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    provider.diminuirQuantidade(
                      produto,
                    );
                  },
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),

                Text(
                  'Quantidade: ${produto.quantidade}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    provider.aumentarQuantidade(
                      produto,
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),

            if (estoqueBaixo)
              const Padding(
                padding: EdgeInsets.only(
                  top: 5,
                ),
                child: Text(
                  'ESTOQUE BAIXO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await provider.excluirProduto(
                    produto,
                  );
                },
                child: const Text(
                  'EXCLUIR',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}