import 'dart:io';

abstract class Encomenda {
  String codigo;
  double peso;

  Encomenda(this.codigo, this.peso);

  void gerarEtiqueta();
}

class EnvioNormal extends Encomenda {
  EnvioNormal(String codigo, double peso) : super(codigo, peso);

  @override
  void gerarEtiqueta() {
    print("Encomenda $codigo confirmada! Prazo de entrega: 10 dias.");
  }
}

class Sedex extends Encomenda {
  Sedex(String codigo, double peso) : super(codigo, peso);

  @override
  void gerarEtiqueta() {
    print("Encomenda $codigo confirmada! Prazo de entrega: 2 dias.");
  }
}

void main() {

  stdout.write("Digite o código da encomenda: ");
  String codigo = stdin.readLineSync()!;

  stdout.write("Qual o peso da encomenda (kg): ");
  double peso = double.parse(stdin.readLineSync()!);

  if (peso > 30) {
    print("Erro: O peso máximo permitido é 30kg");
    return;
  }

  stdout.write("Qual o tipo de frete? (1-Normal / 2-Sedex): ");
  int tipo = int.parse(stdin.readLineSync()!);

  Encomenda encomenda;

  if (tipo == 1) {
    encomenda = EnvioNormal(codigo, peso);
  } else if (tipo == 2) {
    encomenda = Sedex(codigo, peso);
  } else {
    print("Tipo de frete inválido.");
    return;
  }

  encomenda.gerarEtiqueta();
}