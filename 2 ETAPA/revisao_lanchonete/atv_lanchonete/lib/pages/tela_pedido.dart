import 'package:flutter/material.dart';

class TelaPedido extends StatefulWidget {
  const TelaPedido({super.key});

  @override
  State<TelaPedido> createState() => _TelaPedidoState();
}

class _TelaPedidoState extends State<TelaPedido> {
  final _controllerCliente = TextEditingController();
  final _controllerProduto = TextEditingController();
  final _controllerObs = TextEditingController();
  int _contadorPedidos = 0;

  void _enviarPedido() {
    if (_controllerCliente.text.isEmpty || _controllerProduto.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro: Preencha o nome e o produto!'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        _contadorPedidos++;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pedido enviado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      _controllerCliente.clear();
      _controllerProduto.clear();
      _controllerObs.clear();
    }
  }

  @override
  void dispose() {
    _controllerCliente.dispose();
    _controllerProduto.dispose();
    _controllerObs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fazer Pedido')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pedidos enviados: $_contadorPedidos',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerCliente,
              decoration: const InputDecoration(labelText: 'Nome do cliente'),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _controllerProduto,
              decoration: const InputDecoration(labelText: 'Nome do produto desejado'),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _controllerObs,
              decoration: const InputDecoration(labelText: 'Observação do pedido'),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _enviarPedido,
              child: const Text('Enviar Pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
