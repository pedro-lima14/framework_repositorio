import 'dart:io';
void main() {
  stdout.write("Digite seu nome: ");
  String? nome = stdin.readLineSync();
 
  stdout.write("Digite sua idade: ");
  int idade = int.parse(stdin.readLineSync()!);

  stdout.write("Digite sua turma: ");
  String? turma = stdin.readLineSync();

 
  print("\nBom dia " + "$nome. "  "Esses são seus dados: " "\n"  + "Idade: " +"$idade " "\n" + "Turma: "" $turma");
}
