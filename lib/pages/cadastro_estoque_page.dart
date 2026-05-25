import 'package:flutter/material.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({super.key});

  @override
  State<EstoquePage> createState() =>
      _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estoque"),
      ),

      body: const Center(
        child: Text("Página de estoque"),
      ),
    );
  }
}