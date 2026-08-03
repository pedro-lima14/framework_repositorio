import 'dart:io';

abstract class Pagamento {
  final double valorOriginal;

  Pagamento(this.valorOriginal);

  double processar();
}

class Cartao extends Pagamento {
  Cartao(double valorOriginal) : super(valorOriginal);

  @override
  double processar() {
    return valorOriginal * 1.02;
  }
}

class Pix extends Pagamento {
  Pix(double valorOriginal) : super(valorOriginal);

  @override
  double processar() {
    return valorOriginal * 0.9;
  }
}

void main() {
  stdout.write("Digite o saldo da conta: ");
  double saldoConta = double.parse(stdin.readLineSync()!);

  stdout.write("Digite o valor da compra: ");
  double valorCompra = double.parse(stdin.readLineSync()!);

  stdout.write("Qual a forma de pagamento? (1-Cartão / 2-Pix): ");
  int forma = int.parse(stdin.readLineSync()!);

  Pagamento pagamento;

  if (forma == 1) {
    pagamento = Cartao(valorCompra);
  } else if (forma == 2) {
    pagamento = Pix(valorCompra);
  } else {
    print("Forma de pagamento inválida.");
    return;
  }

  double valorFinal = pagamento.processar();

  if (valorFinal <= saldoConta) {
    double restante = saldoConta - valorFinal;
    print("Pagamento de R\$ ${valorFinal.toStringAsFixed(2)} Aprovado!");
    print("Saldo restante: R\$ ${restante.toStringAsFixed(2)}");
  } else {
    double faltou = valorFinal - saldoConta;
    print("Pagamento Negado! Saldo insuficiente.");
    print("Faltam R\$ ${faltou.toStringAsFixed(2)}");
  }
}