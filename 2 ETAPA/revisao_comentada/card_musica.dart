import 'package:flutter/material.dart';

// Widget que representa um "cartão" visual de uma música, mostrando
// nome, artista e se está tocando ou pausada.
// Observação: este widget não está sendo usado em nenhuma outra tela
// do projeto no momento (não aparece import dele em tela_player.dart
// nem em tela_perfil.dart) — parece ser um componente pronto para uso
// futuro, por exemplo em uma lista/grade de músicas.
class CardMusica extends StatelessWidget {
  // Nome da música exibido no card.
  final String nome;

  // Nome do artista exibido no card.
  final String artista;

  // Indica se a música representada por este card está tocando (true)
  // ou pausada (false). Controla cor, tamanho e ícone do card.
  final bool reproduzindo;

  const CardMusica({
    super.key,
    required this.nome,
    required this.artista,
    required this.reproduzindo,
  });

  @override
  Widget build(BuildContext context) {
    // AnimatedContainer faz o card mudar de tamanho e cor suavemente
    // (com animação) sempre que o valor de "reproduzindo" muda.
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),

      // O card fica um pouco maior (290x290) quando a música está
      // tocando, e menor (260x260) quando está pausada.
      width: reproduzindo ? 290 : 260,
      height: reproduzindo ? 290 : 260,

      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        // Cor de fundo: roxo claro quando tocando, cinza quando pausada.
        color: reproduzindo ? Colors.deepPurple.shade100 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ícone que muda conforme o estado: nota musical (tocando)
          // ou nota musical cortada (pausada/sem som).
          Icon(
            reproduzindo ? Icons.music_note : Icons.music_off,
            size: 90,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 20),

          // Nome da música.
          Text(
            nome,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // Nome do artista.
          Text(
            artista,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 12),

          // Texto de status: "Reproduzindo" (verde) ou "Pausado" (vermelho),
          // dando um feedback visual rápido do estado da música.
          Text(
            reproduzindo ? 'Reproduzindo' : 'Pausado',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: reproduzindo ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
