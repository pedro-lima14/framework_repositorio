import 'dart:io';

void main() {
   stdout.write('Digite o valor da compra: ');
   double valor = double.parse(stdin.readLineSync()!);

   String mensagem = valor > 20 ?  '\nGanhou um adesivo' : '\nObrigado pela compra';
   print(mensagem);
}