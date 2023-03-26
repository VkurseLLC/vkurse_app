//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\



class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/loading.gif'),
                  radius: 200,
                  backgroundColor: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
