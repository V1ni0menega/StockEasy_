import 'package:flutter/material.dart';

class CadastroFornecedorPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onFornecedorAdicionado;

  final Map<String, dynamic>? fornecedor;

  const CadastroFornecedorPage({
    super.key,
    required this.onFornecedorAdicionado,
    this.fornecedor,
  });

  @override
  State<CadastroFornecedorPage> createState() =>
      _CadastroFornecedorPageState();
}

class _CadastroFornecedorPageState extends State<CadastroFornecedorPage> {
  final TextEditingController nomeEmpresaController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contatoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.fornecedor != null) {
      nomeEmpresaController.text = widget.fornecedor!["nomeEmpresa"];
      telefoneController.text = widget.fornecedor!["telefone"];
      emailController.text = widget.fornecedor!["email"];
      contatoController.text = widget.fornecedor!["contato"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text(
          widget.fornecedor == null
              ? "Cadastrar Fornecedor"
              : "Editar Fornecedor",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: nomeEmpresaController,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                labelText: "Nome da empresa",
                labelStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: telefoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                labelText: "Telefone",
                labelStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: contatoController,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                labelText: "Pessoa de contato",
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
                  final novoFornecedor = {
                    "nomeEmpresa": nomeEmpresaController.text,
                    "telefone": telefoneController.text,
                    "email": emailController.text,
                    "contato": contatoController.text,
                  };

                  widget.onFornecedorAdicionado(novoFornecedor);

                  Navigator.pop(context);
                },
                child: const Text("Salvar Fornecedor"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}