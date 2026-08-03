import 'package:flutter/material.dart';
import 'package:app/pages/tela_home.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController emailController = TextEditingController(); // controla o campo email
  final TextEditingController senhaController = TextEditingController(); // controla o campo senha

  bool escondersenha = true;
  String mensagemErro = ''; // Guarda a mensagem de erro que pode aparecer na tela
  bool emailValido(String email) {
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return regex.hasMatch(email);
  }
  //r'^[\w\.-] o texto antes do @
  //+@ o simbolo @
  //[\w\.-] texto dps
  //+\.\w+$' .com

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 80,
                color:  const Color.fromARGB(255, 20, 114, 83),
              ),

              const SizedBox(height: 20),
              const Text(
                'Tela login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                'Digite seu seu email e senha para acessar o app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                // campo para o usuario
                controller:
                    emailController, // liga o controlado (criado la em cima)
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email', // Texto principal
                  hintText: 'Digite seu email', //Dica dentro do campo
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                  controller: senhaController,
                  obscureText: escondersenha, // esconde a senha com ...... (true ou false)
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha', 
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),                    
                    suffixIcon: IconButton(// Adiciona o botão de alternar o olho dentro
                      icon: Icon(
                        escondersenha ? Icons.visibility_off : Icons.visibility, // troca o icone
                        color: const Color.fromARGB(255, 20, 114, 83),
                      ),
                      onPressed: () {
                        setState(() {
                          escondersenha = !escondersenha; // Inverte entre true e false a cada clique para mostrar e esconder
                        });
                      },
                    ),
                  ),
                ),

              const SizedBox(height: 15),

              Text(
                mensagemErro, // string declarada la em cima
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                  onPressed: () {
                    String email = emailController.text; //pega o email digitado
                    String senha = senhaController.text; //pega a senha digitada

                    if (!emailValido(email)) {
                      // Se não ter um @ o estado entra aqui
                      setState(() {
                        mensagemErro = "Digite um email valido";
                      });
                    } else if (senha.isEmpty) {
                      // Se a senha for vazia entra aqui
                      setState(() {
                        mensagemErro = "Digite sua senha";
                      });
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaRevisao(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Entrar"))
            ],
          ),
        ),
      ),
    );
  }
}
