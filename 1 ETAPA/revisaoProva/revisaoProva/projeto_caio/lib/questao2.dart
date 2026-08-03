abstract class Pet {
  int id;
  String nome;
  }
  double _peso = 0;

  double get peso => _peso;

  Pet(this.id, this.nome, double peso) {
    this.peso = peso;

  set peso(double valor) {
    if (valor <= 0) {
      throw Exception("Peso inválido");
    }
    _peso = valor;
  }

  void engordar(double ganho) {
    peso = _peso + ganho;
  }

  Map<String, dynamic> toJson();
}

class Cachorro extends Pet {
  String raca;

  Cachorro(int id, String nome, double peso, this.raca)
      : super(id, nome, peso);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'peso': peso,
      'raca': raca,
    };
  }
}