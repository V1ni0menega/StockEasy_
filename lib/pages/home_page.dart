import 'package:flutter/material.dart';
import 'package:stockeasy/pages/cadastros/cadastro_produto_page.dart';
import 'package:stockeasy/pages/cadastro_estoque_page.dart';
import 'package:stockeasy/pages/produtos_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.inventory_2,
                  color: Colors.white,
                  size: 40,
                ),

                SizedBox(width: 16),

                Text(
                  'StockEasy',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [

                    // BOTÕES

                    _buildMenuButton(
                      'Cadastrar Produto',
                      Icons.add,
                      Colors.green,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CadastroProdutoPage(
                                  onProdutoAdicionado:
                                      (produto) {},
                                ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildMenuButton(
                      'Ver Estoque',
                      Icons.inventory,
                      Colors.blue,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const EstoquePage(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildMenuButton(
                      'Buscar Produto',
                      Icons.search,
                      Colors.orange,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ProdutosPage(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 40),

                    // CARDS

                    Row(
                      children: [

                        Expanded(
                          child: _buildInfoCard(
                            'Total',
                            '65',
                            'unidades',
                            Icons.inventory_2_outlined,
                            Colors.blue,
                            Colors.blue.shade50,
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: _buildInfoCard(
                            'Baixo',
                            '3',
                            'itens',
                            Icons.trending_down,
                            Colors.red,
                            Colors.red.shade50,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.symmetric(
                            vertical: 8,
                          ),

                      child: const Text(
                        'Itens em estoque',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    _buildProdutoItem(
                      'Arroz 5kg',
                      '20',
                      Colors.white,
                    ),

                    _buildProdutoItem(
                      'Refrigerante 2L',
                      '15',
                      Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(
    String titulo,
    IconData icone,
    Color cor,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,

      child: Container(
        height: 70,
        width: double.infinity,

        decoration: BoxDecoration(
          color: cor,
          borderRadius:
              BorderRadius.circular(12),
        ),

        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(
              icone,
              color: Colors.white,
            ),

            const SizedBox(width: 10),

            Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    String titulo,
    String valor,
    String subtitulo,
    IconData icone,
    Color cor,
    Color corFundo,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: corFundo,

        borderRadius:
            BorderRadius.circular(8),

        border: Border.all(
          color: cor.withOpacity(0.3),
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              Icon(
                icone,
                color: cor,
                size: 16,
              ),

              const SizedBox(width: 6),

              Text(
                titulo,
                style: TextStyle(
                  color: cor, 
                  fontWeight:
                      FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            valor,
            style: TextStyle(
              color:  Colors.black,
              fontSize: 22,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitulo,
            style: TextStyle(
              color: cor,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProdutoItem(
    String nome,
    String quantidade,
    Color cor,
  ) {
    return Container(
      height: 70,
      width: double.infinity,

      margin:
          const EdgeInsets.only(
            bottom: 12,
          ),

      padding:
          const EdgeInsets.symmetric(
            horizontal: 16,
          ),

      decoration: BoxDecoration(
        color: cor,

        borderRadius:
            BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Text(
            nome,
            style: const TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          Text(
            'Quantidade: $quantidade',
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}