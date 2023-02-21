import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  const Map({Key, key}) : super(key: key);

  @override
  MapState createState() => MapState();
}

class MapState extends State<Map>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Карта', ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 146, 6, 228),
      ),
      body: const Center(
        child: Text('Тут будет карта', style: TextStyle(color: Colors.white),),
      )
    );
  }
}