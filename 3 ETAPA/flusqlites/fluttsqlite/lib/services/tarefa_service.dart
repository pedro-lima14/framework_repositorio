import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import '../models/tarefa.dart';

class TarefaService {
  Future<Database> abrirBanco() async {
    final caminhoBanco = await getDatabasesPath();

    print('LOCAL DO BANCO: $caminhoBanco');

    final caminho = join(caminhoBanco, 'tarefas.db');

    return openDatabase(caminho, version: 1, onCreate: (db, version) async {
      await db.execute('''
              CREATE TABLE tarefas (
              id INTERGER PRIMARY KEY AUTOINCREMENT,
              titulo TEXT NOT NULL,
              concluida INTEGER NO NULL

              )

          ''');
    });
  }

  Future<void> iserirTarefa(Tarefa tarefa) async {
    final db = await abrirBanco();

    await db.insert(
      'tarefas',
      {'titulo': tarefa.titulo, 'concluida': tarefa.concluida},
    );
  }

  Future<List<Tarefa>> listarTarefa() async {
    final db = await abrirBanco();

    final dados = await db.query(
      'tarefas',
    );

    return dados.map((item) {
      return Tarefa(
        id: item['id'] as int,
        titulo: item['titulo'] as String,
        concluida: item['concluida'] == 1,
      );
    }).toList();

    
  }

  Future<void> atualizarTarefa(Tarefa tarefa) async {
    final db = await abrirBanco();

    await db.update(
      'tarefas',
      {
        'concluida': tarefa.concluida? 1 : 0,
      
      },

      where: 'id = ?',

      whereArgs: [
        tarefa.id
      ],
    );
  }
}
