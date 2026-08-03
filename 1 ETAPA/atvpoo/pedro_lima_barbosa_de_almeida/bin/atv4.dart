import 'dart:io';

void fazerConvite({required String nome, String hora = "20:00"}) {
  print("Olá $nome, a festa será às $hora!");
}

void main() {
  fazerConvite(nome: "Felipe", hora: "19:00");

  fazerConvite(hora: "22:30", nome: "Ana");
}
