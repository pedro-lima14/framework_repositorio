

abstract class Video{
  String titulo = '';
  int _classificacao = 0;

  int get classificacao => _classificacao;

  set classificacao(int valor){
    if(valor != 0 && valor != 10 && valor != 12 && valor != 14 && valor != 16 && valor != 18){
      throw Exception('A classificação indicativa deve ser apenas (0,10,12,14,16,18)');

     }
     _classificacao = valor;
  }
}

class Filme extends Video{
  int duracaoMinutos = 0;
   void exibirDados() {
     print('O filme $titulo tem duração de $duracaoMinutos minutos e classificação indicativa de $classificacao');
  }
}
