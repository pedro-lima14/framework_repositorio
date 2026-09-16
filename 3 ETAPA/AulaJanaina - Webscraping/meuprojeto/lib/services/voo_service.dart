import 'dart:convert';
import 'package:http/http.dart' as http;

class VooService {
  static const String baseUrl = 'http://127.0.0.1:5001/api';

  Future<Map<String, dynamic>> buscarVoos({
    required String aeroporto,
    required String tipo,
  }) async {
    final uri = Uri.parse(
      '$baseUrl/voos?aeroporto=$aeroporto&tipo=$tipo',
    );

    final resposta = await http.get(uri);

    if (resposta.statusCode == 200) {
      return jsonDecode(resposta.body);
    }

    try {
      final erro = jsonDecode(resposta.body);

      if (erro is Map<String, dynamic> && erro.containsKey('erro')) {
        throw Exception(erro['erro']);
      }
    } catch (_) {
      // Caso a resposta não seja um JSON de erro válido.
    }

    throw Exception(
      'Erro ao buscar voos. Código: ${resposta.statusCode}',
    );
  }
}