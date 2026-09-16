import 'dart:convert';

import 'package:http/http.dart' as http;

class PokemonService {
  static const String url = 'http://127.0.0.1:5001/pokemons';

  static Future<List<dynamic>> buscarPokemons() async {
    final resposta = await http.get(
      Uri.parse(url),
    );

    if (resposta.statusCode == 200) {
      return jsonDecode(
        resposta.body,
      );
    }

    throw Exception(
      'Erro ao buscar Pokémon',
    );
  }

  static Future<Map<String, dynamic>> buscarDetalhes(int id) async {
    final resposta = await http.get(
      Uri.parse(
        '$url/$id',
      ),
    );

    if (resposta.statusCode == 200) {
      return jsonDecode(
        resposta.body,
      );
    }

    throw Exception(
      'Erro ao buscar detalhes',
    );
  }

  static Future<Map<String, dynamic>> buscarPorNome(
    String nome,
  ) async {
    final resposta = await http.get(
      Uri.parse(
        '$url/nome/${Uri.encodeComponent(nome.toLowerCase())}',
      ),
    );

    if (resposta.statusCode == 200) {
      return jsonDecode(
        resposta.body,
      );
    }

    throw Exception(
      'Pokémon não encontrado',
    );
  }

  static Future<Map<String, dynamic>> buscarAleatorio() async {
    final resposta = await http.get(
      Uri.parse(
        '$url/aleatorio',
      ),
    );

    if (resposta.statusCode == 200) {
      return jsonDecode(
        resposta.body,
      );
    }

    throw Exception(
      'Erro ao buscar Pokémon aleatório',
    );
  }
}
