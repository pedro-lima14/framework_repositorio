import 'dart:io';

void main() {
  stdout.write("Digite um número: ");
  int numero = int.parse(stdin.readLineSync()!);

  bool ehPrimo = true;

  if (numero <= 1) {
    ehPrimo = false;
  } else {
    for (int i = 2; i < numero; i++) {
      if (numero % i == 0) {
        ehPrimo = false;
        break;
      }
    }
  }

  if (ehPrimo) {
    print("$numero é um número primo.");
  } else {
    print("$numero não é um número primo.");
  }
}