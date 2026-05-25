import 'package:flutter/material.dart';

class CadastroMovimentacaoPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onMovimentacaoAdicionada;

  final Map<String, dynamic>? movimentacao;

  const CadastroMovimentacaoPage({
    super.key,
    required this.onMovimentacaoAdicionada,
    this.movimentacao,
  });

  @override
  State<CadastroMovimentacaoPage> createState() =>
      _CadastroMovimentacaoPageState();
}

class _CadastroMovimentacaoPageState extends State<CadastroMovimentacaoPage> {
  final TextEditingController produtoController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();

  String tipoSelecionado = "Entrada";

  @override
  void initState() {
    super.initState();

    if (widget.movimentacao != null) {
      produtoController.text = widget.movimentacao!["produto"];
      quantidadeController.text = widget.movimentacao!["quantidade"].toString();
      tipoSelecionado = widget.movimentacao!["tipo"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text(
          widget.movimentacao == null
              ? "Nova Movimentação"
              : "Editar Movimentação",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: produtoController,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                labelText: "Produto",
                labelStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: tipoSelecionado,
              decoration: const InputDecoration(
                labelText: "Tipo de movimentação",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              items: const [
                DropdownMenuItem(
                  value: "Entrada",
                  child: Text("Entrada"),
                ),
                DropdownMenuItem(
                  value: "Saída",
                  child: Text("Saída"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  tipoSelecionado = value!;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                labelText: "Quantidade",
                labelStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final novaMovimentacao = {
                    "produto": produtoController.text,
                    "tipo": tipoSelecionado,
                    "quantidade": int.tryParse(quantidadeController.text) ?? 0,
                    "data": DateTime.now().toString(),
                  };

                  widget.onMovimentacaoAdicionada(novaMovimentacao);

                  Navigator.pop(context);
                },
                child: const Text("Salvar Movimentação"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}