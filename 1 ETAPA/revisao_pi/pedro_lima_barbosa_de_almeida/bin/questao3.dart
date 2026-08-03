import 'dart:io';

abstract class Veiculo{
    String placa;
    Veiculo(this.placa);
    void realizarRevisao();
}

class Carro extends Veiculo{
    int portas;
    Carro(this.portas, placa):super(placa);

    @override
    void realizarRevisao(){
        print("A placa do carro é $placa e tem $portas portas.");
    }

}
class Moto extends Veiculo{
    int cilindradas;
    Moto(this.cilindradas, placa):super(placa);

    @override
    void realizarRevisao(){
        print("A placa da moto é $placa e tem $cilindradas cilindradas.");
    }

}



void main() {
    int contador = 0;
    List<Veiculo> oficina = [];
    while(contador<3){
        stdout.write("\nDigite o veículo (1-Carro / 2- Moto): ");
        int veiculo = int.parse(stdin.readLineSync()!);
        if(veiculo == 1){
            contador+=1;
            stdout.write("\nDigite a placa do carro: ");
            String? placa = stdin.readLineSync();
            
            stdout.write("Digite o numero de portas do carro: ");
            int portas = int.parse(stdin.readLineSync()!);
            oficina.add(Carro(portas, placa));
            
        }else if(veiculo ==2){
            contador+=1;

            stdout.write("\nDigite a placa da moto: ");
            String? placa = stdin.readLineSync();
            
            stdout.write("Digite as cilindradas da moto: ");
            int cilindradas = int.parse(stdin.readLineSync()!);
            oficina.add(Moto(cilindradas, placa));
        }
        else{
            print("\nVeiculo não encontrado.");
            return;
        }


    }

    stdout.write("Digite a placa do veículo que você deseja buscar: ");
    String? placaProcura = stdin.readLineSync();

    for (var veiculo in oficina){
        if(veiculo.placa == placaProcura){
            veiculo.realizarRevisao();
        }
    }
  
}