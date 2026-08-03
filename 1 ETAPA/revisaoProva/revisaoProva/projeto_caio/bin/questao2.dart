import 'package:projeto_caio/questao2.dart';
import 'dart:convert';
import 'dart:io';

void salvar(List<Pet> lista, File arquivo) {
  List<Map<String, dynamic>> jsonLista =
      lista.map((e) => e.toJson()).toList();

  arquivo.writeAsStringSync(jsonEncode(jsonLista));
}

void main() {
  final arquivo = File('petshop.json');
  List<Pet> lista = [];

  // Leitura
  if (arquivo.existsSync()) {
    String conteudo = arquivo.readAsStringSync();
    List dados = jsonDecode(conteudo);

    for (var item in dados) {
      Cachorro cachorro = Cachorro(
        (item['id'] as num).toInt(),
        item['nome'],
        (item['peso'] as num).toDouble(),
        item['raca'],
      );

      lista.add(cachorro);
    }
  }

  print("1 - Atualizar peso");
  print("2 - Remover pet");
  stdout.write("Escolha: ");
  String opcao = stdin.readLineSync()!;

  switch (opcao) {
    case "1":
      stdout.write("Digite o ID: ");
      int id = int.parse(stdin.readLineSync()!);

      stdout.write("Ganho de peso: ");
      double ganho = double.parse(stdin.readLineSync()!);

      bool encontrado = false;

      for (var pet in lista) {
        if (pet.id == id) {
          pet.engordar(ganho);
          encontrado = true;
          print("Peso atualizado!");
          break;
        }
      }

      if (!encontrado) {
        print("Pet não encontrado.");
      }

      break;

    case "2":
      stdout.write("Digite o ID para remover: ");
      int id = int.parse(stdin.readLineSync()!);

      int antes = lista.length;
      lista.removeWhere((pet) => pet.id == id);

      if (lista.length < antes) {
        print("Removido com sucesso!");
      } else {
        print("Pet não encontrado.");
      }
      break;
  }

  // Relatório
  if (lista.isNotEmpty) {
    double soma = 0;

    for (var pet in lista) {
      soma += pet.peso;
    }

    double media = soma / lista.length;
    print("Média de peso: ${media.toStringAsFixed(2)} kg");
  } else {
    print("Nenhum pet cadastrado.");
  }

  salvar(lista, arquivo);
}