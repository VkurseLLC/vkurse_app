import 'package:flutter/material.dart';

class AuthProvider extends StatelessWidget {
  const AuthProvider({Key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Авторизация', ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 146, 6, 228),
      ),
      body: const Center(
        child: Text('Авторизация', style: TextStyle(color: Colors.white),),
      )
    );
  }
}