import 'package:flutter/material.dart';

class ResumoPedido extends StatelessWidget {
  const ResumoPedido({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Resumo do pedido',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Batatas cromadas'),
              subtitle: Text('1 porção'),
              trailing: Text('R\$ 40'),
            ),
            const ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Casquinha'),
              subtitle: Text('2 unidades'),
              trailing: Text('R\$ 8'),
            ),
            const Divider(),
            const Text(
              'Total: R\$ 48',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.payment),
              label: const Text('Finalizar compra'),
            ),
          ],
        ),
      ),
    );
  }
}