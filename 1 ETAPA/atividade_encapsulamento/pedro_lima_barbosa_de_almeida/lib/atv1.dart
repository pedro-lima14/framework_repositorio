class Termostato {
  double _temperatura = 20.0;

  double get temperatura => _temperatura;

  set temperatura(double valor) {
    if (valor >= 10 && valor <= 30) {
      _temperatura = valor;
    } else {
      throw Exception('Temperatura fora dos limites permitidos!');
    }
  }
}
