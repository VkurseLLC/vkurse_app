import 'package:flutter/material.dart';

// Основной класс для отображения страницы авторизации - ввод номера
class AuthProvider extends StatelessWidget {
  const AuthProvider({Key? key}) : super(key: key);

  // Ниже нужно прописывать структуру виджетов
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Авторизация', ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 146, 6, 228),
      ),

      body: const Center(
        child: 
          Text('Авторизация', style: TextStyle(color: Colors.white),),
          
      ),
    );
  }
}