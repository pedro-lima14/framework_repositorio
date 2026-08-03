abstract class DispositivoSeguranca {
  String _codigoAcesso = '';

  String get codigo => _codigoAcesso;

  set codigo(String novoCodigo){
    if(novoCodigo.length != 4){
      throw Exception('O código deve ter exatamente 4 caracteres!!');
    }
    _codigoAcesso = novoCodigo;
  }
}

class CofreDigital extends DispositivoSeguranca{
  void abrir(String tentativa){
    if(tentativa == codigo){
      print('O código foi aberto!');
    }else{
      print('Acesso negado!');
    }
  }
}