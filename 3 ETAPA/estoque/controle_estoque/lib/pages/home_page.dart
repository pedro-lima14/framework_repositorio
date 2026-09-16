import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/usuario_provider.dart';
import 'cadastro_produto_page.dart';
import 'estoque_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context);

    final nome =
        usuarioProvider.usuarioLogado?.nome ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Controle de Estoque',
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Olá, $nome!',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                const Text(
                  'CONTROLE DE ESTOQUE',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const EstoquePage();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'VER PRODUTOS',
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CadastroProdutoPage();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'CADASTRAR PRODUTO',
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      usuarioProvider.sair();

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginPage();
                          },
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'SAIR',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}