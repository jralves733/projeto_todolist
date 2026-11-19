import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class ListaTarefas extends StatelessWidget {
  final List<Tarefa> tarefas;
  final void Function(Tarefa, bool) alterarTarefa;

  const ListaTarefas({
    Key? key,
    required this.tarefas,
    required this.alterarTarefa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tarefas.length,
      itemBuilder: (context, index) {
        Tarefa tarefa = tarefas[index];

        return CheckboxListTile(
          title: Text(
            tarefa.nome,
            style: TextStyle(
              decoration: tarefa.concluida
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          value: tarefa.concluida,

          // Marca ou desmarca a tarefa
          onChanged: (bool? valor) {
            alterarTarefa(tarefa, valor ?? false);
          },

          controlAffinity: ListTileControlAffinity.trailing,
          dense: true,
        );
      },
    );
  }
}
