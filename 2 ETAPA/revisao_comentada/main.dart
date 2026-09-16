// Importa o pacote principal do Flutter, que traz os widgets visuais
// (botões, textos, telas, etc.) seguindo o padrão Material Design.
import 'package:flutter/material.dart';

// Importa o pacote "device_preview", usado para simular o app rodando
// em diferentes dispositivos (celulares, tablets, etc.) diretamente
// durante o desenvolvimento, sem precisar de um emulador separado.
import 'package:device_preview/device_preview.dart';

// Importa a tela do player de música (a tela inicial do app).
import 'pages/tela_player.dart';

// Função principal: é o ponto de entrada de qualquer app Flutter.
// É a primeira coisa que roda quando o app é aberto.
void main() {
  // runApp() "infla" o widget principal e o exibe na tela do dispositivo.
  runApp(
    // DevicePreview envolve o app inteiro para permitir visualizar
    // como ele ficaria em telas de tamanhos diferentes (moldura de celular
    // aparece ao redor do app quando ativado).
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

// Widget raiz do aplicativo. É "Stateless" porque ele mesmo não muda
// (quem muda são as telas dentro dele).
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp configura o "esqueleto" geral do app: tema, título,
    // e qual é a tela inicial (home).
    return MaterialApp(
      // Remove a faixa vermelha de "DEBUG" que aparece no canto da tela
      // durante o desenvolvimento.
      debugShowCheckedModeBanner: false,

      // Título do app (usado pelo sistema operacional, ex: na lista de apps recentes).
      title: 'My Player',

      // Define o tema visual (cores, estilo) usado em todo o app.
      theme: ThemeData(
        // Gera uma paleta de cores inteira a partir de uma cor "semente"
        // (aqui, o roxo). O Flutter cria automaticamente tons combinando
        // com essa cor para botões, fundos, textos, etc.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        // Ativa o Material Design 3 (visual mais moderno do Flutter).
        useMaterial3: true,
      ),

      // Define qual tela aparece primeiro quando o app abre:
      // aqui é a tela do player de música.
      home: const TelaPlayer(),
    );
  }
}
