import 'package:pedro_lima/pedro_lima.dart';
import 'dart:convert';
import 'dart:io';

void salvarDados(List<Produto> lista, File arquivo) {
  List<Map<String, dynamic>> listaJson =
      lista.map((c) => c.toJson()).toList();

  String jsonFinal = jsonEncode(listaJson);
  arquivo.writeAsStringSync(jsonFinal);
}

void main(List<String> arguments) {

  final arquivo = File('estoque.json');
  List<Produto> lista = [];

  
  if (arquivo.existsSync()) {
    String conteudoArquivo = arquivo.readAsStringSync();

    List<dynamic> dados = jsonDecode(conteudoArquivo);

    for (var item in dados) {
      Mouse mouse = Mouse(
        item['id'],
        item['nome'],
        item['preco'],
        item['dpimaximo'],
      );
      lista.add(mouse);
    }
  }

  stdout.write("Qual ação você deseja realizar?(Cadastrar: 1/Remover: 2)");
  int opcao = int.parse(stdin.readLineSync()!);

  switch (opcao) {
    case 1:
      stdout.write('Digite o ID do novo produto: ');
      int id = int.parse(stdin.readLineSync()!);

      for (var item in lista) {
        if (item.id == id) {
          throw Exception("Erro: ID duplicado");
        }
      }

      stdout.write('Digite o nome do produto: ');
      String nome = stdin.readLineSync()!;

      stdout.write('Digite o preco do produto: ');
      double preco = double.parse(stdin.readLineSync()!);

      if (preco > 300) {
        return Produto.aplicarDesconto();
      }

      Mouse novoLivro = Mouse(dpiMaximo, id, nome, preco);
      lista.add(novoLivro);

      salvarDados(lista, arquivo);
      print("Livro cadastrado com sucesso!");
      
      break;

    case 2:
      stdout.write("Digite o ID para remover: ");
      int id = int.parse(stdin.readLineSync()!);

      int antes = lista.length;
      lista.removeWhere((c) => c.id == id);

      if (lista.length < antes) {
        print("Removido com sucesso!");
        salvarDados(lista, arquivo);
      } else {
        print("Produto não encontrado.");
      }
      break; 


  }

 
}
