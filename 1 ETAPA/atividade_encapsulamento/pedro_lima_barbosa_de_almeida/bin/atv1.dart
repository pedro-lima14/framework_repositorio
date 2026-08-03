import '../lib/encapsulamento.dart';
import 'dart:io';

void main() {
  Termostato t = Termostato();

  try {
    stdout.write('Digite uma temperatura: ');
    double valor = double.parse(stdin.readLineSync()!);

    t.temperatura = valor;
    print('Temperatura ajustada para: ${t.temperatura}');
  } catch (e) {
    print('Erro: $e');
  }
}