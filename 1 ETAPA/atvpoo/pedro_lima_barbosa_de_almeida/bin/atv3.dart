import 'dart:io';

class Mensagem {
  String mensagem;

  Mensagem({required this.mensagem});

  String enviar() {
    return "Enviando mensagem... $mensagem";
  }
}

class SMS extends Mensagem {
  SMS(String texto) : super(mensagem: texto);

  @override
  String enviar() {
    return "Enviando via SMS pelo celular... $mensagem";
  }
}

class Email extends Mensagem {
  Email(String texto) : super(mensagem: texto);

  @override
  String enviar() {
    return "Enviando via servidor de e-mail... $mensagem";
  }
}

void main() {
  SMS sms = SMS("Ola estou pelo sms");
  print(sms.enviar()); 
  
  Email email = Email("Estou pelo email");
  print(email.enviar());
}
