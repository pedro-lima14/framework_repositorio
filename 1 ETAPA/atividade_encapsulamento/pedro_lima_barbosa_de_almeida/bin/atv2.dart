import 'package:encapsulamento_caio/att2.dart';
import 'dart:io';

void main() {
  CofreDigital cofre = CofreDigital();

  try {
    cofre.codigo = "12";
  } catch (e) {
    print('Erro: $e');
  }
  
  cofre.codigo = "1234";

  stdout.write('Digite a tentativa de abrir o cofre: ');
  String tentativa = stdin.readLineSync()!;
  cofre.abrir(tentativa);
}