import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const StockEasyApp());
}

class StockEasyApp extends StatelessWidget {
  const StockEasyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockEasy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

