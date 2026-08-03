import 'dart:io';
void main() {
    stdout.write("Digite a idade do nadador: ");
    int idade = int.parse(stdin.readLineSync()!);

    if(idade >= 5 && idade <=10){
        print("\nCategoria Infantil");
    }
    else if(idade >= 11 && idade <=17){
        print("\nCategoria Juvenil");
    }
    else if(idade >= 18 && idade <=60){
        print("\nCategoria Adulto");
    }
    else if(idade>60){
        print("\nCategoria Sênior");
    }
    else{
        print("\nSem categoria");
    }


}