import 'dart:io';
import 'dart:convert';
import '../lib/conteudo.dart';

void main() {
  String conteudoJson = File('dados.json').readAsStringSync();
  Map<String, dynamic> dados = jsonDecode(conteudoJson);

  Filme filme = Filme();
  filme.titulo = dados['titulo'];

  try {
    filme.validarClassificacao = dados['classificacao'];
    filme.darPlay();
  } catch (e) {
    print('Erro: $e');
  }
}
