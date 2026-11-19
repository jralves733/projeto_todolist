import 'package:flutter/material.dart';

class CampoTarefa extends StatelessWidget {
  final TextEditingController controlador;
  final VoidCallback cadastrar;

  const CampoTarefa({
    Key? key,
    required this.controlador,
    required this.cadastrar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Campo para digitar a tarefa
        TextField(
          controller: controlador,
          decoration: const InputDecoration(
            hintText: 'Tarefa',
            prefixIcon: Icon(Icons.assignment),
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 10),

        // Botão para cadastrar
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: cadastrar,
            child: const Text('Cadastrar'),
          ),
        ),
      ],
    );
  }
}
