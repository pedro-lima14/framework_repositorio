import 'dart:io';

void main() {
  Set<String> pedido ={'Pastel', 'Refrigerante', 'Pastel'};

  print(pedido);
}
//Será exibido apenas: 1 pastel e 1 refrigerante, já que não é permitido repetir itens.