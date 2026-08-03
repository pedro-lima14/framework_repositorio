import 'dart:io';

  class PaiMensagem{
  final String texto;

  PaiMensagem({required this.texto});
  }

  class FilhaSms extends PaiMensagem{
  FilhaSms(String conteudo) : super(texto : conteudo);

  

  @override
  String toString(){
    return "Pai: $texto";
  }
  }

  void main(){
    FilhaSms sms = FilhaSms("Bom dia, filha!");
    print(sms);

  }