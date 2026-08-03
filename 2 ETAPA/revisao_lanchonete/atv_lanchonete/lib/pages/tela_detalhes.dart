import 'package:flutter/material.dart';
import '../models/produto.dart';

class TelaDetalhes extends StatefulWidget {
  final Produto produto;

  const TelaDetalhes({super.key, required this.produto});

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  bool _ehDestaque = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.produto.icone,
                  size: 80,
                  color: Colors.amber,
                ),
                const SizedBox(height: 20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _ehDestaque ? Colors.amber.shade100 : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _ehDestaque
                      ? const Text(
                          'Produto mais pedido da semana!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.produto.nome,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Preço: ${widget.produto.preco}',
                  style: const TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.produto.descricao,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _ehDestaque = !_ehDestaque;
                    });
                  },
                  icon: Icon(_ehDestaque ? Icons.star : Icons.star_border),
                  label: const Text('Adicionar destaque'),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Voltar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
