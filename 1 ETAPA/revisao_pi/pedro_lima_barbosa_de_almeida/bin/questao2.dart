import 'dart:io';

abstract class Dispositivo {
  String nome;

  Dispositivo(this.nome);

  void ligar();
}

class ArCondicionado extends Dispositivo {
  int temperatura;
  ArCondicionado(this.temperatura, String nome) : super(nome);

  @override
  void ligar() {
    print("O ar está na temperatura: $temperatura graus.");
  }
}

class Lampada extends Dispositivo{
  int intensidade;
  Lampada(this.intensidade, String nome) : super(nome);

  @override
  void ligar() {
    print("A intensidade da lampada é: $intensidade");
  }
}

void main() {
    stdout.write("Escolha o dispositivo que vc quer configurar (1-Lâmpada / 2-AR): ");
    int dispositivo = int.parse(stdin.readLineSync()!);

    Dispositivo valor;

    stdout.write("Digite o nome do dispositivo: ");
    String nome = stdin.readLineSync()!;


    if (dispositivo == 1) {
        stdout.write("Qual a intesidade da lampada: ");
        int intensidade = int.parse(stdin.readLineSync()!);

        if (intensidade>0 && intensidade <100){
            valor = Lampada(intensidade, nome);
            valor.ligar();
        }
        else{
            print("Valor inválido!");
        }
  } else if (dispositivo == 2) {
        stdout.write("Qual a temperatura do ar: ");
        int temperatura = int.parse(stdin.readLineSync()!);

        if (temperatura<16 || temperatura >30){
            print("Temperatura fora do limite de segurança.");
        }
        else{
            valor = ArCondicionado(temperatura,nome);
            valor.ligar();
        }
  } else {
        print("Dispositivo não encontrdo.");
        return;
  }

  
}