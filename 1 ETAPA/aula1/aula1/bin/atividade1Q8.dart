import 'dart:io';
void main() {
    stdout.write("Digite um ano qualquer: ");
    int ano = int.parse(stdin.readLineSync()!);

    if(ano %4==0 && ano %100 !=0 || ano %400==0){
        print("\nO ano digitado é bissexto");

    }
    else{
        print("\nO ano digitado não é bissexto");
    }

   


}