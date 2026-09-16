import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/usuario_provider.dart';
import 'cadastro_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool carregando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ÁREA RESTRITA',
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
                  'ÁREA RESTRITA',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 30,
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
                    onPressed: carregando
                        ? null
                        : () async {
                            setState(() {
                              carregando = true;
                            });

                            final provider =
                                Provider.of<UsuarioProvider>(
                              context,
                              listen: false,
                            );

                            final loginCorreto =
                                await provider.fazerLogin(
                              emailController.text.trim(),
                              senhaController.text,
                            );

                            if (!mounted) {
                              return;
                            }

                            setState(() {
                              carregando = false;
                            });

                            if (loginCorreto) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const HomePage();
                                  },
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'E-mail ou senha incorretos.',
                                  ),
                                ),
                              );
                            }
                          },
                    child: Text(
                      carregando ? 'ENTRANDO...' : 'ENTRAR',
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                const Text(
                  'Ainda não possui conta?',
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CadastroPage();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'CRIAR CONTA',
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
    emailController.dispose();
    senhaController.dispose();

    super.dispose();
  }
}