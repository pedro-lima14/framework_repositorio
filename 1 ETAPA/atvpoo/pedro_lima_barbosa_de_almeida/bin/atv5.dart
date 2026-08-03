import 'dart:io';

void main() {
  var calcularDesconto = (double valor) => valor * 0.9;

  var mensagemBoasVindas = (String nome) => "Olá, $nome!";

  print(calcularDesconto(100));
  print(mensagemBoasVindas("Felipe"));
}
