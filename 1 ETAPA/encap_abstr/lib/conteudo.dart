abstract class Conteudo {
  String titulo = '';
  int _classificacao = 0;

  int get classificacaoIndicativa => _classificacao;

  set validarClassificacao(int valor) {
    if (valor < 0 || valor > 18) {
      throw Exception('Classificação inválida');
    }
    _classificacao = valor;
  }

  void darPlay();
}

class Filme extends Conteudo {
  @override
  void darPlay() {
    print('Reproduzindo o filme: $titulo');
  }
}

class Serie extends Conteudo {
  int temporadas = 0;

  @override
  void darPlay() {
    print('Iniciando a série $titulo com $temporadas temporadas');
  }
}
