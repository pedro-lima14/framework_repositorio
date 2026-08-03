abstract class Conta {
  String titular;
  double _saldo = 0; 
  Conta(this.titular);

  double get saldoAtual => _saldo;

  set deposito(double valor) {
    if (valor <= 0) throw Exception('Depósito deve ser positivo!');
    _saldo += valor;
    print('✅ Sucesso: R\$ $valor adicionados à conta de $titular.');
  }

  void sacar(double valor) {
    if (valor <= 0) throw Exception('Valor inválido!');
    if (valor > _saldo) throw Exception('Saldo insuficiente!');
    _saldo -= valor;
  }
}

class ContaCorrente extends Conta {
  ContaCorrente(String titular) : super(titular);

}