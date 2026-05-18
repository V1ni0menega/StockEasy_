import 'package:flutter/material.dart';
import 'produtos_page.dart';
import 'fornecedores_page.dart';
import 'movimentacoes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("StockEasy"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Menu Principal",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,

                children: [

                  _buildMenuCard(
                    context,
                    "Produtos",
                    Icons.inventory_2,
                    Colors.blue,
                    const ProdutosPage(),
                  ),

                  _buildMenuCard(
                    context,
                    "Fornecedores",
                    Icons.people,
                    Colors.green,
                    const FornecedoresPage(),
                  ),

                  _buildMenuCard(
                    context,
                    "Movimentações",
                    Icons.swap_horiz,
                    Colors.orange,
                    const MovimentacoesPage(),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String titulo,
    IconData icone,
    Color cor,
    Widget pagina,
  ) {
    return InkWell(

      borderRadius: BorderRadius.circular(20),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pagina,
          ),
        );
      },

      child: Container(

        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              icone,
              size: 60,
              color: Colors.white,
            ),

            const SizedBox(height: 15),

            Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}