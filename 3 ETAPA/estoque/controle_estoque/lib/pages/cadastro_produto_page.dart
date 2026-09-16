import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/produto_provider.dart';

class CadastroProdutoPage extends StatefulWidget {
  const CadastroProdutoPage({super.key});

  @override
  State<CadastroProdutoPage> createState() {
    return _CadastroProdutoPageState();
  }
}

class _CadastroProdutoPageState
    extends State<CadastroProdutoPage> {
  final TextEditingController nomeController =
      TextEditingController();

  final TextEditingController categoriaController =
      TextEditingController();

  final TextEditingController quantidadeController =
      TextEditingController();

  final TextEditingController precoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Produto',
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                TextField(
                  controller: categoriaController,
                  decoration: const InputDecoration(
                    labelText: 'Categoria',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                TextField(
                  controller: quantidadeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                TextField(
                  controller: precoController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Preço',
                    hintText: 'Ex.: 250.00',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final quantidade =
                          int.tryParse(
                        quantidadeController.text,
                      );

                      final preco =
                          double.tryParse(
                        precoController.text.replaceAll(',', '.'),
                      );

                      if (quantidade == null || preco == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Digite uma quantidade e um preço válidos.',
                            ),
                          ),
                        );

                        return;
                      }

                      final provider =
                          Provider.of<ProdutoProvider>(
                        context,
                        listen: false,
                      );

                      await provider.adicionarProduto(
                        nomeController.text.trim(),
                        categoriaController.text.trim(),
                        quantidade,
                        preco,
                      );

                      if (!mounted) {
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Produto cadastrado com sucesso!',
                          ),
                        ),
                      );

                      Navigator.pop(context);
                    },
                    child: const Text(
                      'CADASTRAR PRODUTO',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    categoriaController.dispose();
    quantidadeController.dispose();
    precoController.dispose();

    super.dispose();
  }
}