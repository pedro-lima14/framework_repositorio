class Livro {
  String titulo;
  int paginas;
  List<String> viloes;

  Livro(this.titulo, this.paginas, this.viloes);

  void exibirDetalhes() {
    print('Título: $titulo');
    print('Páginas: $paginas');
    print('Vilões: ${viloes.isEmpty ? "Nenhum" : viloes.join(", ")}');
    print('--------------------------------------------------');
  }
}

