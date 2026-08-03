import 'package:encapsulamento/encapsulamento.dart';
import 'dart:io';


void limparTela() {
  print(Process.runSync('clear', [], runInShell: true).stdout);
}


void main() {
  Conta minhaConta = ContaCorrente('Igor');


  while (true) {
    limparTela();
    print('=== BANCO DART: GETTERS & SETTERS ===');
    print('Titular: ${minhaConta.titular}');

    print('Saldo: R\$ ${minhaConta.saldoAtual.toStringAsFixed(2)}');
    print('-------------------------------------');
    print('[1] Depositar | [2] Sacar | [3] Sair');
    stdout.write('Escolha: ');

    String? opcao = stdin.readLineSync();
    if (opcao == '3') break;

    try {
      if (opcao == '1') {
        stdout.write('Valor: ');
        double v = double.parse(stdin.readLineSync()!);
        minhaConta.deposito = v;
      } else if (opcao == '2') {
        stdout.write('Valor: ');
        double v = double.parse(stdin.readLineSync()!);
        minhaConta.sacar(v);
      }
    } catch (e) {
      print('\n⚠️ ERRO: ${e.toString().replaceAll('Exception: ', '')}');
      stdout.write('Pressione Enter...');
      stdin.readLineSync();
    }
  }
}