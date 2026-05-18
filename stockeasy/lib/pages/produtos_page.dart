import 'package:flutter/material.dart';
import 'cadastros/cadastro_produto_page.dart';
import '../database/database_helper.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  List<Map<String, dynamic>> produtos = [];

  @override
  void initState() {
    super.initState();
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    final dados = await DatabaseHelper.instance.listarProdutos();

    setState(() {
      produtos = dados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(title: const Text("Produtos")),

      body: ListView.builder(
        padding: const EdgeInsets.only(top: 12),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];

          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.inventory_2, color: Colors.blue),

              title: Text(
                produto["nome"],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                "${produto["categoria"]} • Quantidade: ${produto["quantidade"]}",
                style: const TextStyle(color: Colors.black54),
              ),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "R\$ ${produto["preco"]}",
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 10),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        produtos.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroProdutoPage(
                      produto: produto,
                      onProdutoAdicionado:
                          (Map<String, dynamic> produtoEditado) {
                        setState(() {
                          produtos[index] = produtoEditado;
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroProdutoPage(
                onProdutoAdicionado: (Map<String, dynamic> novoProduto) {
                  setState(() {
                    produtos.add(novoProduto);
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