void main() {

  stdout.write("Digite um valor");
  int nota = int.parse(stdin.readLineSync()!);
  int nota100 = 0;
  int nota50 = 0;
  int nota10 = 0;

  nota100 = nota ~/ 100;
  nota = nota % 100;

  nota50 = nota ~/ 50;
  nota = nota % 50;

  nota10 = nota ~/ 10;
  nota = nota % 10;

  print("Nota10:$nota10 Nota50:$nota50 Nota100:$nota100");

}