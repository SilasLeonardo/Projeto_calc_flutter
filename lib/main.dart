import 'package:flutter/material.dart';
import 'package:flutter_application_calculadora_aula/telas/telaInicial.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu App",
      home: TelaInicial(),
    );
  }
}