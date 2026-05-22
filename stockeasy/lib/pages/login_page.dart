import 'package:flutter/material.dart';
import 'home_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                  ),
                  child: Icon(Icons.inventory_2, color: Colors.white, size: 50),
                ),
                SizedBox(height: 20),
                Text(
                  'Bem vindos ao StockEasy',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Sistema de gerenciamento de estoque ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 40),
                TextField(
                  controller:
                      emailController, // flutter consegue ler o valor do campo de texto através do controller
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller:
                      passwordController, // flutter consegue ler o valor do campo de texto através do controller
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Por favor, preencha todos os campos'),
                        ),
                      );
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Entrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
