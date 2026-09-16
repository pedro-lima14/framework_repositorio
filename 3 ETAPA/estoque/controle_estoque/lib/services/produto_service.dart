import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/produto.dart';

class ProdutoService {
  Future<Database> abrirBanco() async {
    final caminhoBanco = await getDatabasesPath();

    final caminho = join(caminhoBanco, 'estoque.db');

    return openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT NOT NULL,
            senha TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS produtos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            categoria TEXT NOT NULL,
            quantidade INTEGER NOT NULL,
            preco REAL NOT NULL
          )
        ''');
      },
      onOpen: (db) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT NOT NULL,
            senha TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS produtos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            categoria TEXT NOT NULL,
            quantidade INTEGER NOT NULL,
            preco REAL NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> inserirProduto(Produto produto) async {
    final db = await abrirBanco();

    await db.insert(
      'produtos',
      {
        'nome': produto.nome,
        'categoria': produto.categoria,
        'quantidade': produto.quantidade,
        'preco': produto.preco,
      },
    );

    print('INSERT → Produto cadastrado: ${produto.nome}');
  }

  Future<List<Produto>> listarProdutos() async {
    final db = await abrirBanco();

    final dados = await db.query(
      'produtos',
    );

    print('SELECT → Produtos encontrados:');

    for (final produto in dados) {
      print(produto);
    }

    return dados.map((item) {
      return Produto(
        id: item['id'] as int,
        nome: item['nome'] as String,
        categoria: item['categoria'] as String,
        quantidade: item['quantidade'] as int,
        preco: (item['preco'] as num).toDouble(),
      );
    }).toList();
  }

  Future<void> atualizarQuantidade(
    Produto produto,
    int quantidadeAnterior,
  ) async {
    final db = await abrirBanco();

    await db.update(
      'produtos',
      {
        'quantidade': produto.quantidade,
      },
      where: 'id = ?',
      whereArgs: [
        produto.id,
      ],
    );

    print('UPDATE → ${produto.nome}');
    print('Quantidade anterior: $quantidadeAnterior');
    print('Nova quantidade: ${produto.quantidade}');
  }

  Future<void> excluirProduto(Produto produto) async {
    final db = await abrirBanco();

    await db.delete(
      'produtos',
      where: 'id = ?',
      whereArgs: [
        produto.id,
      ],
    );

    print('DELETE → Produto excluído: ${produto.nome}');
  }

  Future<void> mostrarProdutosNoTerminal() async {
    final db = await abrirBanco();

    final produtos = await db.query('produtos');

    print('===== PRODUTOS NO BANCO =====');

    for (final produto in produtos) {
      print(produto);
    }
  }
}