import 'package:flutter/material.dart';
import 'package:app/pages/tela_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revisão App',
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 20, 114, 83)),
        useMaterial3: true,
      ),
      home: const TelaLogin(), // Define a tela de login como inicial
    );
  }
}
