import 'dart:io';

void main() {
    stdout.write("Digite 1° lado do triangulo: ");
    double lado1 = double.parse(stdin.readLineSync()!);

    stdout.write("Digite 2° lado do triangulo: ");
    double lado2 = double.parse(stdin.readLineSync()!);

    stdout.write("Digite 3° lado do triangulo: ");
    double lado3 = double.parse(stdin.readLineSync()!);

    if(lado1 + lado2 > lado3 && lado2 + lado3> lado1 && lado1 + lado3 > lado2 ){
        if(lado1 == lado2 && lado2 == lado3 )
        {
           print("O triangulo é equilátero.");
        }
        else if(lado1 == lado2 || lado2 == lado3 || lado1 == lado3)
        {
            print("O triangulo é isóceles.");
        }
        else{
            print("O triangulo é escaleno");
        }
    }

    else{
        print("Não é possível formar um triangulo");
    }

   


}