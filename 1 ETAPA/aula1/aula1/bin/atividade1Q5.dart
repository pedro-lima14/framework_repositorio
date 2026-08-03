import 'dart:io';

void main() {
  stdout.write("Digite a temperatura: ");
  double temperatura = double.parse(stdin.readLineSync()!);

  print("\nEscolha uma opção:");
  print("1 - Celsius para Fahrenheit");
  print("2 - Fahrenheit para Celsius");
  print("3 - Celsius para Kelvin");
  stdout.write("Opção: ");

  int opcao = int.parse(stdin.readLineSync()!);

  double resultado;

  switch (opcao) {
    case 1:
      resultado = (temperatura * 9 / 5) + 32;
      print("Resultado: $resultado °F");
      break;

    case 2:
      resultado = (temperatura - 32) * 5 / 9;
      print("Resultado: $resultado °C");
      break;

    case 3:
      resultado = temperatura + 273.15;
      print("Resultado: $resultado K");
      break;

    default:
      print("Opção Inválida!");
  }
}