import 'dart:convert';
import 'dart:io';
import '../lib/pedro_lima.dart';

void salvar(List<ItemColecao> biblioteca) {
  final arquivo = File('./biblioteca.json');

  List<Map<String, dynamic>> dados =
      biblioteca.map((item) => item.toJson()).toList();

  arquivo.writeAsStringSync(jsonEncode(dados));
}

void main() {
  final arquivo = File('./biblioteca.json');
  List<ItemColecao> biblioteca = [];

  // Leitura do arquivo
  if (arquivo.existsSync()) {
    var dados = jsonDecode(arquivo.readAsStringSync());

    for (var item in dados) {
      biblioteca.add(
        Livro(
          item['id'],
          item['titulo'],
          item['autor'],
          item['paginas'],
        ),
      );
    }
  }

  while (true) {
    print('\n=== BIBLIOTECA ===');
    print('[1] Cadastrar livro');
    print('[2] Pesquisar por autor');
    print('[3] Sair');
    stdout.write('Escolha: ');
    var op = stdin.readLineSync();

    if (op == '3') break;

    try {
      if (op == '1') {
        // Cadastro
        stdout.write('ID: ');
        int id = int.parse(stdin.readLineSync()!);

        // Regra: ID não duplicado
        bool existe = biblioteca.any((livro) => livro.id == id);
        if (existe) {
          print('Erro: ID já existe.');
          continue;
        }

        stdout.write('Título: ');
        String titulo = stdin.readLineSync()!;

        stdout.write('Autor: ');
        String autor = stdin.readLineSync()!;

        stdout.write('Páginas: ');
        int paginas = int.parse(stdin.readLineSync()!);

        Livro livro = Livro(id, titulo, autor, paginas);

        // Regra: livro denso
        if (paginas > 500) {
          print('Este é um livro denso.');
        }

        biblioteca.add(livro);
        salvar(biblioteca);
      } else if (op == '2') {
        // Pesquisa
        stdout.write('Nome do autor: ');
        String nome = stdin.readLineSync()!;

        var encontrados = biblioteca
            .where((livro) =>
                livro.autor.toLowerCase() == nome.toLowerCase())
            .toList();

        if (encontrados.isEmpty) {
          print('Nenhum livro encontrado.');
        } else {
          for (var livro in encontrados) {
            print(
                '${livro.titulo} - ${(livro as Livro).paginas} páginas');
          }
        }
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}