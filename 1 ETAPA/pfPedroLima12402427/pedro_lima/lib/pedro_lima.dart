abstract class Produto {
  int id;
  String nome;
  double _preco;

  double get preco => _preco;

  Produto(this.id, this.nome, this._preco);

  set preco(double valor) {
    if (valor <= 0) {
      throw Exception("Preço Inválido");
    }
    _preco = valor;
  }

  void aplicarDesconto(double desconto) {
    desconto = _preco * 0.1;
    preco = _preco -  desconto;
  }

  Map<String, dynamic> toJson();

}

class Mouse extends Produto {
  int dpiMaximo;

  Mouse(this.dpiMaximo, int id, String nome, double preco)
      : super(id, nome, preco);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'dpiMaximo': dpiMaximo,
    };
  }
}