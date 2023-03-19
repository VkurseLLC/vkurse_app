import 'package:flutter/material.dart';

class Map1 extends StatefulWidget {

  @override
  _Map1 createState() => _Map1();

}

class _Map1 extends State<Map1> {

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          height: height * 0.5,
          color: Colors.amber,
          child: ElevatedButton(
            onPressed: (){}, 
            child: Text("Test")
          ),
        ),
      ),
    );
  }
}