import 'package:flutter/material.dart';
import './cadastros/cadastro_movimentacao_page.dart';

class MovimentacoesPage extends StatefulWidget {
  const MovimentacoesPage({super.key});

  @override
  State<MovimentacoesPage> createState() =>
      _MovimentacoesPageState();
}

class _MovimentacoesPageState
    extends State<MovimentacoesPage> {

  final List<Map<String, dynamic>> movimentacoes = [

    {
      "produto": "Notebook Dell",
      "tipo": "Entrada",
      "quantidade": 5,
      "data": "13/05/2026",
    },

    {
      "produto": "Mouse Gamer",
      "tipo": "Saída",
      "quantidade": 2,
      "data": "12/05/2026",
    },

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Movimentações"),
      ),

      body: ListView.builder(

        padding: const EdgeInsets.only(top: 12),

        itemCount: movimentacoes.length,

        itemBuilder: (context, index) {

          final movimentacao =
              movimentacoes[index];

          final bool entrada =
              movimentacao["tipo"] == "Entrada";

          return Card(

            color: Colors.white,

            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),

            child: ListTile(

              leading: Icon(

                entrada
                    ? Icons.arrow_downward
                    : Icons.arrow_upward,

                color:
                    entrada
                        ? Colors.green
                        : Colors.red,
              ),

              title: Text(

                movimentacao["produto"],

                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(

                "${movimentacao["tipo"]} • Quantidade: ${movimentacao["quantidade"]}",

                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),

              trailing: IconButton(

                onPressed: () {

                  setState(() {

                    movimentacoes.removeAt(index);

                  });

                },

                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),

              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(

                    builder: (context) =>
                        CadastroMovimentacaoPage(

                      movimentacao:
                          movimentacao,

                      onMovimentacaoAdicionada:
                          (
                            Map<String, dynamic>
                            movimentacaoEditada,
                          ) {

                        setState(() {

                          movimentacoes[index] =
                              movimentacaoEditada;

                        });

                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),

      floatingActionButton:
          FloatingActionButton(

        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(

              builder: (context) =>
                  CadastroMovimentacaoPage(

                onMovimentacaoAdicionada:
                    (
                      Map<String, dynamic>
                      novaMovimentacao,
                    ) {

                  setState(() {

                    movimentacoes.add(
                      novaMovimentacao,
                    );

                  });

                },
              ),
            ),
          );
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}