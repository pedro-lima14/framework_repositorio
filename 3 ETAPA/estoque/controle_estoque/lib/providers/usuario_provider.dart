import 'package:flutter/material.dart';

import '../models/usuario.dart';
import '../services/usuario_service.dart';

class UsuarioProvider extends ChangeNotifier {
  final UsuarioService service = UsuarioService();

  Usuario? usuarioLogado;

  Future<bool> cadastrarUsuario(
    String nome,
    String email,
    String senha,
  ) async {
    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      return false;
    }

    final existe = await service.emailExiste(email);

    if (existe) {
      return false;
    }

    final usuario = Usuario(
      nome: nome,
      email: email,
      senha: senha,
    );

    await service.inserirUsuario(usuario);

    notifyListeners();

    return true;
  }

  Future<bool> fazerLogin(
    String email,
    String senha,
  ) async {
    if (email.isEmpty || senha.isEmpty) {
      return false;
    }

    final usuario = await service.fazerLogin(
      email,
      senha,
    );

    if (usuario == null) {
      usuarioLogado = null;
      notifyListeners();
      return false;
    }

    usuarioLogado = usuario;

    notifyListeners();

    return true;
  }

  void sair() {
    usuarioLogado = null;

    notifyListeners();
  }
}