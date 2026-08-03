import 'dart:io';
import 'dart:convert';
import 'package:pedro_lima_barbosa_de_almeida/conteudo.dart';

void main() {
  List<Conteudo> catalogo = [];

  String conteudoJson = File('dados.json').readAsStringSync();
  List<dynamic> dados = jsonDecode(conteudoJson);

  for (var item in dados) {
    Filme filme = Filme(item['id'], item['titulo']);
    filme.validarClassificacao = item['classificacao'];
    catalogo.add(filme);
  }

  try {
    print('Digite o ID do novo filme:');
    int id = int.parse(stdin.readLineSync()!);

    for (var c in catalogo) {
      if (c.id == id) {
        throw Exception('Erro: ID já cadastrado no sistema!');
      }
    }

    print('Digite o título:');
    String titulo = stdin.readLineSync()!;

    print('Digite a classificação:');
    int classificacao = int.parse(stdin.readLineSync()!);

    Filme novoFilme = Filme(id, titulo);
    novoFilme.validarClassificacao = classificacao;

    catalogo.add(novoFilme);
  } catch (e) {
    print(e);
  }

  print('Digite o ID para excluir:');
  int idExcluir = int.parse(stdin.readLineSync()!);

  catalogo.removeWhere((c) => c.id == idExcluir);

  salvarCatalogo(catalogo);
}

void salvarCatalogo(List<Conteudo> catalogo) {
  List<Map<String, dynamic>> listaJson =
      catalogo.map((c) => c.toJson()).toList();

  File('dados.json').writeAsStringSync(jsonEncode(listaJson));
}