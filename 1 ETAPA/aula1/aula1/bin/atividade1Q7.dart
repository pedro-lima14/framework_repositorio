import 'dart:io';

void main() {
  
stdout.write("Digite seu salário: ");
double salario = double.parse(stdin.readLineSync()!);
double desconto = 0;

if(salario<= 2000){
    print("Você está isento de imposto");
}

else if(salario >=2001 && salario <=4000){
desconto = salario*0.07 - salario;
salario = salario *0.93;
print("O desconto foi de $desconto, e o salario final é:  $salario");
}
  
else{
   desconto = salario*0.15;
   salario = salario *0.85;
   
print("O desconto foi de $desconto, e o salario final é:  $salario");
} 

}