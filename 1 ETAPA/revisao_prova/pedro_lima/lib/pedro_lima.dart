abstract class ItemColecao{

  int id;
  String titulo;
  String _autor;

  ItemColecao(this.id, this.titulo, this._autor); 

  String get autor => _autor;

    set autor(String valor) {
    if (valor.isEmpty || valor.length < 3) {
      throw Exception("Autor inválido");
    }
    _autor = valor;
  }

  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'titulo':titulo,
      'autor':autor,
    };
  }
}


class Livro extends ItemColecao{
  int paginas;

  Livro(int id, String titulo, String autor, this.paginas) : super (id,titulo,autor);

  @override
  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'titulo':titulo,
      'autor':autor,
      'paginas':paginas
    };
  }
}