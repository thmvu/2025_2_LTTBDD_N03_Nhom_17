import 'package:du_an_todolist/screens/login_screen.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'screens/main_screen.dart';
=======
>>>>>>> 306b66f8244be5f52232d3e8f1a5b0881ce2f0e8

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
<<<<<<< HEAD
      home: const MainScreen(),
=======
      home: Login_Screen(),
>>>>>>> 306b66f8244be5f52232d3e8f1a5b0881ce2f0e8
    );
  }
}
