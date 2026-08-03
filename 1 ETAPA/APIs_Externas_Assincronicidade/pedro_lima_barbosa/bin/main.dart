import 'dart:io';

import 'package:pedro_lima_barbosa/modelo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> buscarCopas() async {
  final url = Uri.parse('https://api.football-data.org/v4/competitions/');

  final resposta = await http.get(url);

  if (resposta.statusCode == 200) {
    Map<String, dynamic> corpo = jsonDecode(resposta.body);

    List lista = corpo['competitions'];

    List<Copas> copas = lista.map((item) {
      return Copas(
        item['id'],
        item['area']['name'],
        item['name'],
        item['code'] ?? 'Sem código',
        item['type'],
      );
    }).toList();

    List jsonList = copas.map((c) => c.toJson()).toList();

    File file = File('backup_api.json');
    await file.writeAsString(jsonEncode(jsonList));

    print("Dados baixados e salvos com sucesso!");
  } else {
    print("Erro ao buscar dados: ${resposta.statusCode}");
  }
}

List<Copas> lerArquivo() {
  File file = File('backup_api.json');

  if (!file.existsSync()) return [];

  String conteudo = file.readAsStringSync();
  List dados = jsonDecode(conteudo);

  return dados.map((item) {
    return Copas(
      item['id'],
      item['nomePais'],
      item['nomeComp'],
      item['codigoComp'],
      item['tipo'],
    );
  }).toList();
}

void salvarArquivo(List<Copas> lista) {
  File file = File('backup_api.json');

  List jsonList = lista.map((c) => c.toJson()).toList();

  file.writeAsStringSync(jsonEncode(jsonList));
}

void main() async {
  await buscarCopas();

  int opcao = -1;

  while (opcao != 0) {
    print('\n=== MENU ===');
    print('[1] Listar tudo');
    print('[2] Pesquisar');
    print('[3] Deletar');
    print('[0] Sair');

    opcao = int.parse(stdin.readLineSync()!);

    List<Copas> lista = lerArquivo();

    switch (opcao) {
      case 1:
        for (var c in lista) {
          c.exibirResultado();
        }
        break;

      case 2:
        print('Digite o nome da competição:');
        String busca = stdin.readLineSync()!.toLowerCase();

        for (var c in lista) {
          if (c.nomeComp.toLowerCase().contains(busca)) {
            c.exibirResultado();
          }
        }
        break;

      case 3:
        print('Digite o ID para deletar:');
        int id = int.parse(stdin.readLineSync()!);

        lista.removeWhere((c) => c.idComp == id);
        salvarArquivo(lista);

        print('Removido com sucesso!');
        break;

      case 0:
        print('Saída concluida');
        break;

      default:
        print('Opção inválida!');
    }
  }
}

