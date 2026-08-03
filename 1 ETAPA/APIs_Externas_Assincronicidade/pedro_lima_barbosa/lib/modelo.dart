class Copas{
  int idComp = 0;
  String nomePais;
  String codigoComp;
  String nomeComp;
  String tipo;

  Copas(this.idComp, this.nomePais, this.codigoComp, this.nomeComp, this.tipo);

  Map<String, dynamic> toJson(){
    return{
      'id' : idComp,
      'name' : nomePais,
      'nameArea' : nomeComp,
      'code': codigoComp,
      'type': tipo
    };
    
    
  }


  void exibirResultado() {
    print('ID: $idComp');
    print('Competição: $nomeComp');
    print('Código: $codigoComp');
    print('Tipo: $tipo');
    print('País: $nomePais');
    print('-----------------------------');
  }
}