import 'dart:io';

abstract class Usuario {
  String login;

  Usuario(this.login);

  void acessar();
}

class Gratuito extends Usuario {
  Gratuito(String login) : super(login);

  @override
  void acessar() {
    print("Acesso limitado. Assine o Premium para ver mais.");
  }
}

class Premium extends Usuario {
  DateTime dataExpiracao;

  Premium(String login, this.dataExpiracao) : super(login);

  @override
  void acessar() {
    if (dataExpiracao.isAfter(DateTime.now())) {
      print("Acesso liberado! Bem-vindo $login.");
      print("Sua assinatura expira em: $dataExpiracao");
    } else {
      print("Erro: Sua assinatura expirou em $dataExpiracao! Renove seu plano.");
    }
  }
}

void validarAcesso(Usuario u) {
  u.acessar();
}

void main() {

  stdout.write("Digite seu login: ");
  String login = stdin.readLineSync()!;

  stdout.write("Tipo de conta (1-Gratuito / 2-Premium): ");
  int tipo = int.parse(stdin.readLineSync()!);

  Usuario usuario;

  if (tipo == 1) {
    usuario = Gratuito(login);

  } else if (tipo == 2) {

    stdout.write("Digite a data de validade (AAAA-MM-DD): ");
    String data = stdin.readLineSync()!;

    DateTime dataExpiracao = DateTime.parse(data);

    usuario = Premium(login, dataExpiracao);

  } else {
    print("Tipo de conta inválido.");
    return;
  }

  validarAcesso(usuario);
}