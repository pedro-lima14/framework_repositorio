import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stephenapi/stephenapi.dart';

Future<List<dynamic>> buscarLivrosApi() async {
  final url = Uri.parse('https://stephen-king-api.onrender.com/api/books');

  final resposta = await http.get(url);

  if (resposta.statusCode == 200) {
    Map<String, dynamic> corpoDecodificado = jsonDecode(resposta.body);

    return corpoDecodificado['data'];
  } else {
    throw Exception('Falha no servidor. Código: ${resposta.statusCode}');
  }
}

Future<void> main() async {
  print('Iniciando busca no catálogo do Stephen King...\n');

  List<Livro> catalogo = [];

  try {
    List<dynamic> listaDinamica = await buscarLivrosApi();

    for (var item in listaDinamica) {
      String titulo = item['Title'];
      int paginas = item['Pages'];

      List<dynamic> viloesBrutos = item['villains'];
      List<String> nomesDosViloes = [];

      for (var vilao in viloesBrutos) {
        nomesDosViloes.add(vilao['name']);
      }

      Livro novoLivro = Livro(titulo, paginas, nomesDosViloes);
      catalogo.add(novoLivro);
    }

    print('=== LIVROS ENCONTRADOS ===\n');

    for (var livro in catalogo) {
      livro.exibirDetalhes();
    }
  } catch (e) {
    print('⚠️ Ocorreu um erro ao tentar acessar a internet.');
    print('Detalhes: $e');
  }
}
