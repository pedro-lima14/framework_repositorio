import 'dart:io';

void main() {
  
print("Atividade 2");

  int contador = 0;

  while(contador <=50)
  {
    
    contador++;

    if(contador % 5 == 0 && contador % 3 == 0){
        print("$contador FizzBuzz");
     }
    else if (contador % 3 == 0){
        print("$contador Fizz");
     }

     else if (contador % 5 == 0){
        print("$contador Buzz");
     }

    

     else{
        print(contador);
     }


     
     
  }

}