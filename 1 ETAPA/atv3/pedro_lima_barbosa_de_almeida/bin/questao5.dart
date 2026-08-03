import 'dart:io';

void main() {
  stdout.write("Digite o valor: ");
  String? dez_reais = stdin.readLineSync();

  int valorCovertido = 0;
  try{
    if(dez_reais!= null){
        valorCovertido = int.parse(dez_reais);
    }

    if(dez_reais!= null){
        print("\nValor válido!");
    }
    
  }
  catch (FormatExeption){
    print("\nDigite apenas numeros para o valor!");
  }
  finally{
    print("\nOperação concluída.");
  }
}