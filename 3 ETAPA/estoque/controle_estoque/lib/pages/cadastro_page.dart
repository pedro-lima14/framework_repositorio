import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/usuario_provider.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() {
    return _CadastroPageState();
  }
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro',
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
                const Text(
                  'CRIAR CONTA',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                TextField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final provider =
                          Provider.of<UsuarioProvider>(
                        context,
                        listen: false,
                      );

                      final sucesso =
                          await provider.cadastrarUsuario(
                        nomeController.text.trim(),
                        emailController.text.trim(),
                        senhaController.text,
                      );

                      if (!mounted) {
                        return;
                      }

                      if (sucesso) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Usuário cadastrado com sucesso!',
                            ),
                          ),
                        );

                        Navigator.pop(context);
                      } else {
                        final existe =
                            await provider.service.emailExiste(
                          emailController.text.trim(),
                        );

                        if (!mounted) {
                          return;
                        }

                        if (existe) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'E-mail já cadastrado.',
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Preencha todos os campos.',
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      'CADASTRAR',
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

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();

    super.dispose();
  }
}