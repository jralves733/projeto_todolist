import 'package:flutter/material.dart';
import 'telas/tela_inicial.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To do List',
      home: const TelaInicial(),
    );
  }
}
