import 'dart:io';

void main(List<String> arguments) {
  double velocidadeMedida = 0.0
  double velocidadeMaximaVia = 0.0

  stdout.write("Digite a velocidade máxima permitida na via")
  double? velocidadeMaximaVia = double.parse(stdin.readLineSync()!);

  stdout.write("Digite a velocidade medida")
  double? velocidadeMedida = double.parse(stdin.readLineSync()!);
}
