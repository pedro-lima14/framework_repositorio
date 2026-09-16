import 'package:flutter/material.dart';

// Widget reutilizável que representa um botão de controle do player
// (anterior, play/pause, próxima). É usado três vezes na tela do player,
// cada vez com um ícone e uma ação diferentes.
// É "StatelessWidget" porque ele mesmo não guarda estado: apenas exibe
// o que recebe de fora (ícone, ação e se é o botão principal).
class BotaoPlayer extends StatelessWidget {
  // Ícone exibido dentro do botão (ex: play, pause, skip_next...).
  final IconData icone;

  // Função executada quando o botão é pressionado.
  final VoidCallback aoClicar;

  // Indica se este é o botão "principal" (o de play/pause, no meio),
  // que deve aparecer maior que os outros dois.
  final bool principal;

  const BotaoPlayer({
    super.key,
    required this.icone,
    required this.aoClicar,
    this.principal = false, // Por padrão, não é o botão principal.
  });

  @override
  Widget build(BuildContext context) {
    // IconButton.filled cria um botão circular com fundo preenchido
    // (cor do tema) e o ícone no centro.
    return IconButton.filled(
      onPressed: aoClicar,

      // Tamanho do ícone: maior (42) se for o botão principal,
      // menor (30) para os botões de anterior/próxima.
      iconSize: principal ? 42 : 30,

      // Espaçamento interno do botão: maior para o botão principal,
      // deixando-o visivelmente maior que os outros.
      padding: EdgeInsets.all(
        principal ? 18 : 12,
      ),

      icon: Icon(icone),
    );
  }
}
