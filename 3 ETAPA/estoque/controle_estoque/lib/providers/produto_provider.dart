import 'package:flutter/material.dart';

import '../models/produto.dart';
import '../services/produto_service.dart';

class ProdutoProvider extends ChangeNotifier {
  final ProdutoService service = ProdutoService();

  List<Produto> produtos = [];

  Future<void> carregarProdutos() async {
    produtos = await service.listarProdutos();

    notifyListeners();
  }

  Future<void> adicionarProduto(
    String nome,
    String categoria,
    int quantidade,
    double preco,
  ) async {
    if (nome.isEmpty || categoria.isEmpty) {
      return;
    }

    final produto = Produto(
      nome: nome,
      categoria: categoria,
      quantidade: quantidade,
      preco: preco,
    );

    await service.inserirProduto(produto);

    await carregarProdutos();
  }

  Future<void> aumentarQuantidade(Produto produto) async {
    final quantidadeAnterior = produto.quantidade;

    produto.quantidade++;

    await service.atualizarQuantidade(
      produto,
      quantidadeAnterior,
    );

    await carregarProdutos();
  }

  Future<void> diminuirQuantidade(Produto produto) async {
    if (produto.quantidade <= 0) {
      return;
    }

    final quantidadeAnterior = produto.quantidade;

    produto.quantidade--;

    await service.atualizarQuantidade(
      produto,
      quantidadeAnterior,
    );

    await carregarProdutos();
  }

  Future<void> excluirProduto(Produto produto) async {
    await service.excluirProduto(produto);

    await carregarProdutos();
  }

  Future<void> mostrarProdutosNoTerminal() async {
    await service.mostrarProdutosNoTerminal();
  }
}