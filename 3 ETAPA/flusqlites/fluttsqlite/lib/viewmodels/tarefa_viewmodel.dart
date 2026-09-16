import 'package:flutter/material.dart';
import 'package:fluttsqlite/services/tarefa_service.dart';

import '../models/tarefa.dart';

class TarefaViewModel extends ChangeNotifier {
  final TarefaService service = TarefaService();

  List<Tarefa> tarefas = [];

  Future<void> carregarTarefas() async {
    tarefas = await service.listarTarefa();

    notifyListeners();
  }

  Future<void> adicionarTarefa(String titulo) async {
    if (titulo.isEmpty) {
      return;
    }

    final tarefa = Tarefa(
      titulo: titulo,
    );

    await service.iserirTarefa(tarefa);

    await carregarTarefas();
  }

  Future<void> alterarTarefa(Tarefa tarefa) async {
    tarefa.concluida = !tarefa.concluida;

    await service.atualizarTarefa(tarefa);

    await carregarTarefas();
  }
}
