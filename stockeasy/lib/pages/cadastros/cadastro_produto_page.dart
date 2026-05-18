import 'package:flutter/material.dart';

class CadastroProdutoPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onProdutoAdicionado;

  final Map<String, dynamic>? produto;

  const CadastroProdutoPage({
    super.key,
    required this.onProdutoAdicionado,
    this.produto,
  });

  @override
  State<CadastroProdutoPage> createState() =>
      _CadastroProdutoPageState();
}

class _CadastroProdutoPageState
    extends State<CadastroProdutoPage> {

  final TextEditingController nomeController =
      TextEditingController();

  final TextEditingController categoriaController =
      TextEditingController();

  final TextEditingController precoController =
      TextEditingController();

  final TextEditingController quantidadeController =
      TextEditingController();

  @override
  void initState() {

    super.initState();

    if (widget.produto != null) {

      nomeController.text =
          widget.produto!["nome"];

      categoriaController.text =
          widget.produto!["categoria"];

      precoController.text =
          widget.produto!["preco"].toString();

      quantidadeController.text =
          widget.produto!["quantidade"].toString();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(
          widget.produto == null
              ? "Cadastrar Produto"
              : "Editar Produto",
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(

              controller: nomeController,

              style: const TextStyle(
                color: Colors.black,
              ),

              decoration: const InputDecoration(

                labelText: "Nome do produto",

                labelStyle: TextStyle(
                  color: Colors.black54,
                ),

                border: OutlineInputBorder(),

                filled: true,

                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            TextField(

              controller: categoriaController,

              style: const TextStyle(
                color: Colors.black,
              ),

              decoration: const InputDecoration(

                labelText: "Categoria",

                labelStyle: TextStyle(
                  color: Colors.black54,
                ),

                border: OutlineInputBorder(),

                filled: true,

                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            TextField(

              controller: precoController,

              keyboardType: TextInputType.number,

              style: const TextStyle(
                color: Colors.black,
              ),

              decoration: const InputDecoration(

                labelText: "Preço",

                labelStyle: TextStyle(
                  color: Colors.black54,
                ),

                border: OutlineInputBorder(),

                filled: true,

                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            TextField(

              controller: quantidadeController,

              keyboardType: TextInputType.number,

              style: const TextStyle(
                color: Colors.black,
              ),

              decoration: const InputDecoration(

                labelText: "Quantidade",

                labelStyle: TextStyle(
                  color: Colors.black54,
                ),

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

                  final novoProduto = {

                    "nome": nomeController.text,

                    "categoria":
                        categoriaController.text,

                    "quantidade":
                        int.tryParse(
                          quantidadeController.text,
                        ) ??
                        0,

                    "preco":
                        double.tryParse(
                          precoController.text,
                        ) ??
                        0.0,
                  };

                  widget.onProdutoAdicionado(
                    novoProduto,
                  );

                  Navigator.pop(context);
                },

                child: const Text(
                  "Salvar Produto",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}