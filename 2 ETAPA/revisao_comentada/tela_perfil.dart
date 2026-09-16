import 'package:flutter/material.dart';

// Tela de perfil do usuário: permite digitar nome e estilo musical
// favorito e "salvar" essas informações (apenas na memória, não em banco de dados).
// É "StatefulWidget" porque os campos de texto e os dados salvos mudam
// conforme o usuário interage.
class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  // Controlador do campo de texto "Nome": permite ler e limpar o que
  // o usuário digitou nesse campo.
  final TextEditingController nomeController = TextEditingController();

  // Controlador do campo de texto "Estilo musical favorito".
  final TextEditingController estiloController = TextEditingController();

  // Guarda o nome depois que o usuário clica em "Salvar perfil".
  String nomeSalvo = '';

  // Guarda o estilo musical depois de salvo.
  String estiloSalvo = '';

  // Guarda uma mensagem de erro (ex: campo vazio) para mostrar na tela.
  String mensagemErro = '';

  // Função chamada ao clicar no botão "Salvar perfil".
  void salvarPerfil() {
    // Pega o texto digitado, removendo espaços em branco extras
    // no início/fim (trim).
    final String nome = nomeController.text.trim();
    final String estilo = estiloController.text.trim();

    // Validação: se algum campo estiver vazio, mostra mensagem de erro
    // e interrompe a função (não salva nada).
    if (nome.isEmpty || estilo.isEmpty) {
      setState(() {
        mensagemErro = 'Preencha todos os campos.';
      });
      return;
    }

    // Se passou na validação, salva os valores e limpa a mensagem de erro.
    // setState() faz a tela ser redesenhada mostrando o card de "Perfil salvo!".
    setState(() {
      nomeSalvo = nome;
      estiloSalvo = estilo;
      mensagemErro = '';
    });
  }

  // dispose() é chamado quando essa tela é destruída (ex: o usuário
  // sai dela). Aqui liberamos a memória usada pelos controladores de
  // texto, para evitar vazamento de memória.
  @override
  void dispose() {
    nomeController.dispose();
    estiloController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior com o título da tela.
      appBar: AppBar(
        title: const Text('Meu perfil'),
      ),

      body: SingleChildScrollView(
        // Permite rolar a tela se o teclado ou o conteúdo ocupar muito espaço.
        padding: const EdgeInsets.all(24),
        child: Column(
          // Faz os elementos filhos (como os campos de texto) esticarem
          // para ocupar toda a largura disponível.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Ícone grande representando um avatar/foto de perfil genérica.
            const Icon(
              Icons.account_circle,
              size: 100,
            ),
            const SizedBox(height: 30),

            // Campo de texto para digitar o nome do usuário.
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(
                  Icons.person,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Campo de texto para digitar o estilo musical favorito.
            TextField(
              controller: estiloController,
              decoration: const InputDecoration(
                labelText: 'Estilo musical favorito',
                prefixIcon: Icon(
                  Icons.music_note,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Mostra a mensagem de erro em vermelho, só se ela não estiver vazia
            // (ou seja, só aparece quando falta preencher algum campo).
            if (mensagemErro.isNotEmpty)
              Text(
                mensagemErro,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            const SizedBox(height: 20),

            // Botão que dispara a função salvarPerfil() ao ser pressionado.
            ElevatedButton(
              onPressed: salvarPerfil,
              child: const Text(
                'Salvar perfil',
              ),
            ),
            const SizedBox(height: 30),

            // Card de confirmação: só aparece depois que o perfil for
            // salvo com sucesso (quando "nomeSalvo" não está mais vazio).
            if (nomeSalvo.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Ícone de "sucesso" (checkmark verde).
                    const Icon(
                      Icons.check_circle,
                      size: 45,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Perfil salvo!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Mostra o nome e o estilo musical que foram salvos.
                    Text(
                      'Nome: $nomeSalvo',
                    ),
                    Text(
                      'Estilo favorito: $estiloSalvo',
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 30),

            // Botão para voltar para a tela do player de música
            // (fecha essa tela, retornando à tela anterior na pilha de navegação).
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Voltar para o player',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
