import 'package:flutter/material.dart';
import 'cadastros/cadastro_fornecedores_page.dart';

class FornecedoresPage extends StatefulWidget {
  const FornecedoresPage({super.key});

  @override
  State<FornecedoresPage> createState() =>
      _FornecedoresPageState();
}

class _FornecedoresPageState
    extends State<FornecedoresPage> {

  final List<Map<String, dynamic>> fornecedores = [

    {
      "nomeEmpresa": "Dell Brasil",
      "telefone": "(51) 99999-1111",
      "email": "contato@dell.com",
      "contato": "Carlos",
    },

    {
      "nomeEmpresa": "Kabum",
      "telefone": "(11) 98888-2222",
      "email": "vendas@kabum.com",
      "contato": "Fernanda",
    },

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color.fromARGB(255, 0, 0, 0),

      appBar: AppBar(
        title: const Text("Fornecedores"),
      ),

      body: ListView.builder(

        padding: const EdgeInsets.only(top: 12),

        itemCount: fornecedores.length,

        itemBuilder: (context, index) {

          final fornecedor =
              fornecedores[index];

          return Card(

            color: Colors.white,

            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),

            child: ListTile(

              leading: const Icon(
                Icons.business,
                color: Colors.green,
              ),

              title: Text(

                fornecedor["nomeEmpresa"],

                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(

                "${fornecedor["contato"]} • ${fornecedor["telefone"]}",

                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),

              trailing: IconButton(

                onPressed: () {

                  setState(() {

                    fornecedores.removeAt(index);

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
                        CadastroFornecedorPage(

                      fornecedor: fornecedor,

                      onFornecedorAdicionado:
                          (
                            Map<String, dynamic>
                            fornecedorEditado,
                          ) {

                        setState(() {

                          fornecedores[index] =
                              fornecedorEditado;

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
                  CadastroFornecedorPage(

                onFornecedorAdicionado:
                    (
                      Map<String, dynamic>
                      novoFornecedor,
                    ) {

                  setState(() {

                    fornecedores.add(
                      novoFornecedor,
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