class Tarefa {
  int ?id;
  String titulo;

  bool concluida;

  Tarefa({
    this.id,
    required this.titulo,
    this.concluida = false,
  });
}
