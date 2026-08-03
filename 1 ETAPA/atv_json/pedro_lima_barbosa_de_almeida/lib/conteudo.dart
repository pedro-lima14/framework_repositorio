
abstract class Conteudo {
  int id;
  String titulo;
  int _classificacao = 0;

  Conteudo(this.id, this.titulo);

  int get classificacaoIndicativa => _classificacao;

  set validarClassificacao(int valor) {
    if (valor < 0 || valor > 18) {
      throw Exception('Classificação inválida');
    }
    _classificacao = valor;
  }

  void darPlay();

  Map<String, dynamic> toJson();
}

class Filme extends Conteudo {
  Filme(int id, String titulo) : super(id, titulo);

  @override
  void darPlay() {
    print('Reproduzindo o filme: $titulo');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'classificacao': classificacaoIndicativa,
    };
  }
}

class Serie extends Conteudo {
  int temporada = 0;
  Serie(int id, String titulo) : super(id, titulo);

  @override
  void darPlay() {
    print('Reproduzindo a serie: $titulo de $temporada temporadas');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'classificacao': classificacaoIndicativa,
      'temporadas': temporada,
    };
  }
}