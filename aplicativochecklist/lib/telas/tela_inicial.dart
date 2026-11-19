import 'package:flutter/material.dart';
import '../models/tarefa.dart';
import '../widgets/campo_tarefa.dart';
import '../widgets/lista_tarefas.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  // Controla o campo de texto
  final TextEditingController controlador = TextEditingController();

  // Guarda as tarefas
  List<Tarefa> tarefas = [];

  // Cadastra uma nova tarefa
  void cadastrarTarefa() {
    String texto = controlador.text.trim();

    if (texto.isNotEmpty) {
      setState(() {
        // Adiciona no início da lista
        tarefas.insert(0, Tarefa(nome: texto));
      });

      controlador.clear();
    }
  }

  // Altera a posição da tarefa
  void alterarTarefa(Tarefa tarefa, bool valor) {
    setState(() {
      tarefa.concluida = valor;

      // Remove da posição atual
      tarefas.remove(tarefa);

      if (valor) {
        // Concluída vai para o final
        tarefas.add(tarefa);
      } else {
        // Desmarcada volta para o início
        tarefas.insert(0, tarefa);
      }
    });
  }

  // Libera o controlador
  @override
  void dispose() {
    controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do List'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Campo e botão de cadastro
            CampoTarefa(
              controlador: controlador,
              cadastrar: cadastrarTarefa,
            ),

            const SizedBox(height: 10),

            // Lista de tarefas
            Expanded(
              child: ListaTarefas(
                tarefas: tarefas,
                alterarTarefa: alterarTarefa,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
