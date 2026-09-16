import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/usuario.dart';

class UsuarioService {
  Future<Database> abrirBanco() async {
    final caminhoBanco = await getDatabasesPath();

    print('LOCAL DO BANCO: $caminhoBanco');

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

  Future<bool> emailExiste(String email) async {
    final db = await abrirBanco();

    final dados = await db.query(
      'usuarios',
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );

    return dados.isNotEmpty;
  }

  Future<void> inserirUsuario(Usuario usuario) async {
    final existe = await emailExiste(usuario.email);

    if (existe) {
      return;
    }

    final db = await abrirBanco();

    await db.insert(
      'usuarios',
      {
        'nome': usuario.nome,
        'email': usuario.email,
        'senha': usuario.senha,
      },
    );

    print('INSERT → Usuário cadastrado: ${usuario.nome}');
  }

  Future<Usuario?> fazerLogin(String email, String senha) async {
    final db = await abrirBanco();

    print('SELECT → Procurando usuário: $email');

    final dados = await db.query(
      'usuarios',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
      limit: 1,
    );

    if (dados.isEmpty) {
      print('SELECT → Usuário não encontrado');
      return null;
    }

    final item = dados.first;

    final usuario = Usuario(
      id: item['id'] as int,
      nome: item['nome'] as String,
      email: item['email'] as String,
      senha: item['senha'] as String,
    );

    print('SELECT → Usuário encontrado: ${usuario.nome}');

    return usuario;
  }
}