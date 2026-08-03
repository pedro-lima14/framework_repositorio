import 'dart:math';

void main() {
  int vidaHeroi = 100;
  int vidaMonstro = 100;
  int ataqueHeroi = 15;
  int ataqueMonstro = 12;

  Random random = Random();
  int turno = 1;

  while (vidaHeroi > 0 && vidaMonstro > 0) {
    print("\n--- Turno $turno ---");

    int numeroHeroi = random.nextInt(10) + 1;
    int numeroMonstro = random.nextInt(10) + 1;

    print("Número do Herói: $numeroHeroi");
    print("Número do Monstro: $numeroMonstro"); 

    if (numeroHeroi > numeroMonstro) {
      vidaMonstro -= ataqueHeroi;
      print("Herói atacou!");
    } else if (numeroMonstro > numeroHeroi) {
      vidaHeroi -= ataqueMonstro;
      print("Monstro atacou!");
    } else {
      print("Empate! Ninguém atacou.");
    }

    print("Vida Herói: $vidaHeroi");
    print("Vida Monstro: $vidaMonstro");

    turno++;
  }

  if (vidaHeroi > 0) {
    print("\n Herói venceu!");
  } else {
    print("\n Monstro venceu!");
  }
}