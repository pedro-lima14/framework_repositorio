import 'package:encapsulamento_caio/att3.dart';
import 'dart:io';

void main() {
  String cadastrar;

  do {
    stdout.write('Deseja cadastrar um filme (1=sim/2=não): ');
    cadastrar = stdin.readLineSync()!;

    if (cadastrar == '1') {
      Process.runSync('clear', [], runInShell: true);

      Filme filme = Filme();

      try {
        stdout.write('Digite o nome do filme: ');
        filme.titulo = stdin.readLineSync()!;

        while (true) {
          try {
            stdout.write('Digite a classificação (0,10,12,14,16,18): ');
            int valor = int.parse(stdin.readLineSync()!);
            filme.classificacao = valor;
            break;
          } catch (e) {
            print('Erro: classificação inválida. Tente novamente.');
          }
        }

        stdout.write('Digite a duração do filme: ');
        filme.duracaoMinutos = int.parse(stdin.readLineSync()!);

        print('\nFilme cadastrado com sucesso!');
        filme.exibirDados();
      } catch (e) {
        print('Erro: $e');
      }
    }

  } while (cadastrar == '1');
}