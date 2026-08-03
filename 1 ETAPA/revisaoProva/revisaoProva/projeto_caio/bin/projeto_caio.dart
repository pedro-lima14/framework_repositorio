import 'package:projeto_caio/projeto_caio.dart';
import 'dart:convert';
import 'dart:io';

void salvarCatalogo(List<ItemColecao> catalogo, File arquivo) {
  List<Map<String, dynamic>> listaJson =
      catalogo.map((c) => c.toJson()).toList();

  String jsonFinal = jsonEncode(listaJson);
  arquivo.writeAsStringSync(jsonFinal);
}

void main() {
  final arquivo = File('biblioteca.json');
  List<ItemColecao> lista = [];

  
  if (arquivo.existsSync()) {
    String conteudoArquivo = arquivo.readAsStringSync();

    List<dynamic> dados = jsonDecode(conteudoArquivo);

    for (var item in dados) {
      Livro livro = Livro(
        item['paginas'],
        item['id'],
        item['titulo'],
        item['autor'],
      );
      lista.add(livro);
    }
  }

  // Cadastro
  stdout.write('Digite o ID do livro: ');
  int id = int.parse(stdin.readLineSync()!);

  // Regra de ID duplicado
  for (var item in lista) {
    if (item.id == id) {
      throw Exception("Erro: ID já cadastrado no sistema!");
    }
  }

  stdout.write('Digite o título do livro: ');
  String titulo = stdin.readLineSync()!;

  stdout.write('Digite o número de páginas do livro: ');
  int paginas = int.parse(stdin.readLineSync()!);

  
  if (paginas > 500) {
    print("Este é um livro denso!");
  }

  stdout.write('Digite o autor do livro: ');
  String autor = stdin.readLineSync()!.toLowerCase();

  Livro novoLivro = Livro(paginas, id, titulo, autor);
  lista.add(novoLivro);

  // Salvar
  salvarCatalogo(lista, arquivo);
  print("Livro cadastrado com sucesso!");

  // Pesquisa
  stdout.write("Deseja pesquisar autor? [S/N]: ");
  String opcao = stdin.readLineSync()!.toLowerCase();

  switch (opcao) {
    case "s":
      stdout.write("Digite o nome do autor para pesquisa: ");
      String busca = stdin.readLineSync()!.toLowerCase();

      bool encontrado = false;

      for (var item in lista) {
        if (item.autor.toLowerCase().contains(busca)) {
          print("ID: ${item.id}");
          print("Título: ${item.titulo}");
          print("Autor: ${item.autor}");
          print("Páginas: ${(item as Livro).paginas}");
          print("\n");
          encontrado = true;
        }
      }

      if (!encontrado) {
        print("Nenhum livro encontrado para esse autor.");
      }
      break;

    case "n":
      print("Programa encerrado.");
      break;
  }
}