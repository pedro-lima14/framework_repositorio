import 'package:flutter/material.dart';

import '../services/pokemon_service.dart';

class PokemonProvider extends ChangeNotifier {
  List<dynamic> pokemons = [];

  Map<String, dynamic>? pokemonSelecionado;

  bool carregando = false;

  String? erro;

  Future<void> carregarPokemons() async {
    carregando = true;
    erro = null;

    notifyListeners();

    try {
      pokemons = await PokemonService.buscarPokemons();
    } catch (e) {
      erro = 'Erro ao buscar Pokémon';
    }

    carregando = false;

    notifyListeners();
  }

  Future<void> carregarDetalhes(
    int id,
  ) async {
    carregando = true;
    erro = null;

    pokemonSelecionado = null;

    notifyListeners();

    try {
      pokemonSelecionado = await PokemonService.buscarDetalhes(
        id,
      );
    } catch (e) {
      erro = 'Pokémon não encontrado';
    }

    carregando = false;

    notifyListeners();
  }

  Future<void> pesquisarPorNome(
    String nome,
  ) async {
    carregando = true;
    erro = null;

    pokemonSelecionado = null;

    notifyListeners();

    try {
      pokemonSelecionado = await PokemonService.buscarPorNome(
        nome,
      );
    } catch (e) {
      erro = 'Pokémon não encontrado';
    }

    carregando = false;

    notifyListeners();
  }

  Future<Map<String, dynamic>?> carregarAleatorio() async {
    carregando = true;
    erro = null;

    notifyListeners();

    try {
      final pokemon = await PokemonService.buscarAleatorio();

      carregando = false;

      notifyListeners();

      return pokemon;
    } catch (e) {
      erro = 'Erro ao buscar Pokémon aleatório';

      carregando = false;

      notifyListeners();

      return null;
    }
  }
}
