import 'package:flutter/material.dart';

// Importa o widget personalizado do botão do player (play, pause, próxima, etc.).
import '../widgets/botao_player.dart';
// Importa a tela de perfil, para onde o usuário navega ao tocar no ícone de perfil.
import 'tela_perfil.dart';

// Tela principal do app: o player de música.
// É "StatefulWidget" porque essa tela tem dados que mudam com o tempo
// (música tocando, volume, música atual, etc.) e a tela precisa se
// redesenhar quando isso acontece.
class TelaPlayer extends StatefulWidget {
  const TelaPlayer({super.key});

  @override
  State<TelaPlayer> createState() => _TelaPlayerState();
}

// Classe que guarda o "estado" (os dados que podem mudar) da TelaPlayer.
class _TelaPlayerState extends State<TelaPlayer> {
  // Lista de músicas do app. Cada música é um mapa (dicionário) com
  // nome, artista, álbum, duração e caminho da imagem de capa.
  final List<Map<String, String>> musicas = [
    {
      'nome': 'I\'m So Sorry',
      'artista': 'Imagine Dragons',
      'album': 'Smoke + Mirrors',
      'duracao': '3:50',
      'imagem': 'assets/Smoke_and_Mirrors_album_cover.jpeg',
    },
    {
      'nome': 'Sunflower',
      'artista': 'Post Malone e Swae Lee',
      'album': 'Spider-Man: Into the Spider-Verse '
          '(Soundtrack From & Inspired by the Motion Picture)',
      'duracao': '2:38',
      'imagem': 'assets/images.jpeg',
    },
    {
      'nome': 'The Last of Us Part II',
      'artista': 'Gustavo Santaolalla',
      'album': 'The Last of Us Part II (Original Soundtrack)',
      'duracao': '2:52',
      'imagem': 'assets/thelastofus.jpeg',
    },
  ];

  // Índice (posição) da música atual dentro da lista "musicas".
  int indiceAtual = 0;

  // Controla se a música está tocando (true) ou pausada (false).
  bool tocando = false;

  // Nível de volume, de 0 a 10.
  int volume = 5;

  // Alterna entre tocar e pausar a música quando o botão central é pressionado.
  void playPause() {
    setState(() {
      // setState() avisa o Flutter que algo mudou e a tela precisa
      // ser redesenhada com os novos valores.
      tocando = !tocando;
    });
  }

  // Avança para a próxima música da lista.
  void proximaMusica() {
    setState(() {
      indiceAtual++;

      // Se passar da última música, volta para a primeira (loop).
      if (indiceAtual >= musicas.length) {
        indiceAtual = 0;
      }

      // Ao trocar de música, o player para (pausa) automaticamente.
      tocando = false;
    });
  }

  // Volta para a música anterior da lista.
  void musicaAnterior() {
    setState(() {
      indiceAtual--;

      // Se estiver na primeira música, volta para a última (loop).
      if (indiceAtual < 0) {
        indiceAtual = musicas.length - 1;
      }

      tocando = false;
    });
  }

  // Aumenta o volume em 1, até o limite máximo de 10.
  void aumentarVolume() {
    if (volume < 10) {
      setState(() {
        volume++;
      });
    }
  }

  // Diminui o volume em 1, até o mínimo de 0.
  void diminuirVolume() {
    if (volume > 0) {
      setState(() {
        volume--;
      });
    }
  }

  // Abre uma janela deslizante (modal) de baixo para cima, mostrando
  // informações detalhadas da música atual (nome, artista, álbum, duração).
  void abrirInformacoes() {
    final musica = musicas[indiceAtual];

    showModalBottomSheet(
      context: context,
      builder: (context) {
        // Conteúdo do modal.
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            // Faz a coluna ocupar só o espaço necessário (não a tela toda).
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título do modal.
              const Text(
                'Sobre a música',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Nome da música.
              Text(
                musica['nome']!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Dados extras: artista, álbum e duração.
              Text('Artista: ${musica['artista']}'),
              Text('Álbum: ${musica['album']}'),
              Text('Duração: ${musica['duracao']}'),
              const SizedBox(height: 25),
              // Botão para fechar o modal e voltar para a tela do player.
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Fechar'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Método responsável por construir (desenhar) a tela inteira.
  @override
  Widget build(BuildContext context) {
    // Pega os dados da música que está tocando no momento.
    final musica = musicas[indiceAtual];

    // Pega a largura da tela do dispositivo, para adaptar o layout
    // (responsividade: telas grandes vs telas pequenas).
    final larguraTela = MediaQuery.of(context).size.width;

    // Define se a tela é "grande" (ex: tablet/desktop) a partir de 700px de largura.
    final bool telaGrande = larguraTela >= 700;

    // Define o tamanho da capa do álbum: maior em telas grandes, menor em celulares.
    final double tamanhoCapa = telaGrande ? 380 : 280;

    return Scaffold(
      // Barra superior do app (cabeçalho).
      appBar: AppBar(
        title: const Text('MyMusic'),
        centerTitle: true, // Centraliza o título na barra.
        actions: [
          // Ícone de perfil no canto direito da barra superior.
          IconButton(
            onPressed: () {
              // Ao clicar, navega para a tela de perfil (empilhando
              // uma nova tela por cima da atual).
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TelaPerfil();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
          ),
        ],
      ),

      // Corpo principal da tela.
      body: SingleChildScrollView(
        // Permite rolar a tela caso o conteúdo não caiba (ex: tela pequena).
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            // Limita a largura máxima do conteúdo a 600px, para não ficar
            // esticado demais em telas muito largas.
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),

                // Capa do álbum: uma imagem com cantos arredondados e sombra,
                // que muda de tamanho suavemente (animação) dependendo se
                // a música está tocando ou não.
                AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  width: tocando ? tamanhoCapa : tamanhoCapa - 15,
                  height: tocando ? tamanhoCapa : tamanhoCapa - 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 25,
                        offset: Offset(0, 12),
                        color: Colors.black45,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    // Corta a imagem seguindo os cantos arredondados do container.
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      musica['imagem']!,
                      fit: BoxFit.cover, // Preenche o espaço sem distorcer.
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Nome da música atual.
                Text(
                  musica['nome']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),

                // Nome do artista, em cinza claro (texto secundário).
                Text(
                  musica['artista']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(height: 20),

                // Barra de progresso da música (simulada: valores fixos,
                // não reflete o tempo real de reprodução).
                LinearProgressIndicator(
                  value: tocando ? 0.55 : 0.25,
                  minHeight: 5,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 12),

                // Linha com o tempo decorrido (esquerda) e a duração total
                // da música (direita), abaixo da barra de progresso.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tocando ? '02:20' : '01:00',
                    ),
                    Text(
                      musica['duracao']!,
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Linha com os três botões de controle: anterior, play/pause, próxima.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Botão de música anterior.
                    BotaoPlayer(
                      icone: Icons.skip_previous,
                      aoClicar: musicaAnterior,
                    ),
                    const SizedBox(width: 25),

                    // Botão principal (maior): alterna entre ícone de
                    // "play" e "pause" conforme o estado "tocando".
                    BotaoPlayer(
                      icone: tocando ? Icons.pause : Icons.play_arrow,
                      aoClicar: playPause,
                      principal: true,
                    ),
                    const SizedBox(width: 25),

                    // Botão de próxima música.
                    BotaoPlayer(
                      icone: Icons.skip_next,
                      aoClicar: proximaMusica,
                    ),
                  ],
                ),
                const SizedBox(height: 35),

                // Linha de controle de volume: botão de diminuir,
                // texto mostrando o volume atual, e botão de aumentar.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: diminuirVolume,
                      icon: const Icon(
                        Icons.volume_down,
                      ),
                    ),
                    const SizedBox(width: 15),

                    // Mostra "Sem som" quando o volume é 0, senão mostra
                    // o valor numérico do volume.
                    Text(
                      volume == 0 ? '🔇 Sem som' : 'Volume: $volume',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 15),
                    IconButton(
                      onPressed: aumentarVolume,
                      icon: const Icon(
                        Icons.volume_up,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Botão que abre o modal com mais informações sobre a música.
                OutlinedButton.icon(
                  onPressed: abrirInformacoes,
                  icon: const Icon(
                    Icons.info_outline,
                  ),
                  label: const Text(
                    'Mais informações',
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
