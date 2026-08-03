abstract class ItemColecao {
  int id;
  String titulo;
  String _autor = "";

  String get autor => _autor;

  ItemColecao(this.id, this.titulo, String autor) {
    this.autor = autor;
  }

  set autor(String nome) {
    if (nome.isEmpty || nome.length < 3) {
      throw Exception("Autor inválido");
    }
    _autor = nome;
  }

  // Método abstrato exigido
  Map<String, dynamic> toJson();
}

class Livro extends ItemColecao {
  int paginas;

  Livro(this.paginas, int id, String titulo, String autor)
      : super(id, titulo, autor);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'autor': autor,
      'paginas': paginas,
    };
  }
}