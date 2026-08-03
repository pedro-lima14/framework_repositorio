import 'package:flutter/material.dart';
import '../widgets/card_icone.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String mensagemFeedback = 'Nenhum botão clicado ainda.';

  void atualizarMensagem(String nomeCard) {
    setState(() {
      mensagemFeedback = 'Você clicou em $nomeCard';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Pedro Lima'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: const Color(0xFFA7CDFF),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFA7CDFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                mensagemFeedback,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            CardIcone(
              icone: Icons.person,
              titulo: 'Perfil',
              descricao: 'Gerencie suas informações pessoais e foto de conta.',
              textoBotao: 'Ver Perfil',
              cor: const Color.fromARGB(255, 159, 33, 243),
              aoClicar: () => atualizarMensagem('Perfil'),
            ),

            CardIcone(
              icone: Icons.settings,
              titulo: 'Configurações',
              descricao: 'Ajuste as preferências do sistema e privacidade.',
              textoBotao: 'Abrir Ajustes',
              cor: const Color.fromARGB(255, 248, 77, 25),
              aoClicar: () => atualizarMensagem('Configurações'),
            ),

            CardIcone(
              icone: Icons.favorite,
              titulo: 'Favoritos',
              descricao: 'Confira os itens e conteúdos que você salvou.',
              textoBotao: 'Ver Favoritos',
              cor: const Color.fromARGB(255, 45, 158, 35),
              aoClicar: () => atualizarMensagem('Favoritos'),
            ),

            CardIcone(
              icone: Icons.notifications,
              titulo: 'Notificações',
              descricao: 'Fique por dentro dos seus alertas e avisos recentes.',
              textoBotao: 'Ver Alertas',
              cor: const Color.fromARGB(255, 0, 0, 0),
              aoClicar: () => atualizarMensagem('Notificações'),
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
