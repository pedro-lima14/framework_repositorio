import 'dart:io';

abstract class Lutador {
  final String nome;
  int vida;

  Lutador({required this.nome, required this.vida});

  void executarHabilidade(int escolha, Lutador alvo);
}

class ManaInsuficienteException implements Exception {
  String mensagem() => "Mana Insuficiente para usar bola de fogo!";
}

class Guerreiro extends Lutador {
  Guerreiro(String nome, int vida) : super(nome: nome, vida: vida);

  @override
  void executarHabilidade(int escolha, Lutador alvo) {
    if (escolha == 1) {
      print("$nome deu soco");
      alvo.vida -= 10;
    } else if (escolha == 2) {
      print("$nome deu espadada");
      alvo.vida -= 25;
    } else {
      print("Habilidade inválida");
    }
  }
}

class Mago extends Lutador {
  int mana;

  Mago(String nome, int vida, this.mana)
      : super(nome: nome, vida: vida);

  @override
  void executarHabilidade(int escolha, Lutador alvo) {
    if (escolha == 1) {
      print("$nome deu cajadada");
      alvo.vida -= 5;
    } else if (escolha == 2) {
      if (mana >= 20) {
        print("$nome lançou bola de fogo");
        alvo.vida -= 40;
        mana -= 20;
      } else {
        throw ManaInsuficienteException();
      }
    } else {
      print("Habilidade inválida");
    }
  }
}

void main() {
  Map<int, Lutador> arena = {};

  arena[1] = Guerreiro("Cavaleiro clash", 150);
  arena[2] = Mago("Mago clash", 120, 40);

  print("=== INÍCIO DA BATALHA ===");

  while (arena[1]!.vida > 0 && arena[2]!.vida > 0) {
    try {
      print("\nDigite o ID do lutador que vai atacar (1 ou 2): ");
      int idAtacante = int.parse(stdin.readLineSync()!);

      print("Digite a habilidade (1 ou 2): ");
      int habilidade = int.parse(stdin.readLineSync()!);

      Lutador atacante = arena[idAtacante]!;
      Lutador alvo = (idAtacante == 1) ? arena[2]! : arena[1]!;

      atacante.executarHabilidade(habilidade, alvo);

      if (alvo.vida < 0) alvo.vida = 0;

    } on FormatException {
      print("Erro: Digite apenas números válidos!");
    } on ManaInsuficienteException catch (e) {
      print("Erro: ${e.mensagem()}");
    } catch (e) {
      print("Erro inesperado: $e");
    } finally {
      print("\n--- STATUS ATUAL ---");
      print("${arena[1]!.nome} - Vida: ${arena[1]!.vida}");

      if (arena[2] is Mago) {
        Mago mago = arena[2] as Mago;
        print("${mago.nome} - Vida: ${mago.vida} - Mana: ${mago.mana}");
      } else {
        print("${arena[2]!.nome} - Vida: ${arena[2]!.vida}");
      }

      print("---------------------");
    }
  }

  print("\n=== FIM DA BATALHA ===");

  if (arena[1]!.vida <= 0) {
    print("${arena[2]!.nome} venceu!");
  } else {
    print("${arena[1]!.nome} venceu!");
  }
}
