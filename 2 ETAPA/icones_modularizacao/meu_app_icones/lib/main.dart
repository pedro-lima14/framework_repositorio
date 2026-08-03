import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; 
import 'pages/tela_home.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => const MeuApp(),
  ));
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true, 
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const TelaHome(),
    );
  }
}

