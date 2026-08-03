import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import './pages/botoes_emocoes.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MeuApp()
    ),
  );
}

class MeuApp extends StatelessWidget { // estatico
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(// configura o app ("base")
      debugShowCheckedModeBanner: false,

      title: 'Revisao Flutter',      
      theme: ThemeData(// define visual      
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          secondary: Colors.amber,
          ),
        useMaterial3: true,
      ),
      home: const TelaEmocoes(),// chama primeira tela 
    );
  }
}