import 'dart:io';

void main() {
  

  stdout.write("Digite a velocidade máxima permitida na via: ");
  double? velocidadeMaximaVia =double.parse(stdin.readLineSync()!);
  

  stdout.write("\nDigite a velocidade medida: ");
  double? velocidadeMedida =double.parse(stdin.readLineSync()!);
  

  if(velocidadeMedida > (velocidadeMaximaVia * 1.11) && velocidadeMedida < (velocidadeMaximaVia *1.20))
  {

  stdout.write("\nVocê recebeu uma multa leve de: 130 reais\n");
  }
  else if (velocidadeMedida > (velocidadeMaximaVia * 1.20)){
    stdout.write("\nVocê recebeu uma multa grave de: 880,00 + apreensão da CNH\n");
  }
   else{
    stdout.write("\nVocê está insento de multa");
   }

}