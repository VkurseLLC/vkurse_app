// //?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\
import 'dart:io';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:shared_preferences/shared_preferences.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:image_picker/image_picker.dart';
import 'package:vkurse_app/pages/style/canvas.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _Test();

}

class _Test extends State<Test> {

  late XFile _pickedImage;
  final ImagePicker picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CircleAvatar(
            radius: 80,
            child: Text("Picture"),
          ),
          
          const SizedBox(height: 10.0),

          ElevatedButton(
            child: Text("Pick Image"),
            onPressed: (){
              _showPickOptionDialog(context);
            }, 
          )
        ],
      ),
    );
  }

  _loadPicker(ImageSource sourse) async {
    XFile? picked = await picker.pickImage(source: sourse);
    if (picked == null) {
      setState(() {
        _pickedImage = picked!;
      });
    }
  }
  
  void _showPickOptionDialog(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Выберите из галлерери"),
              onTap: (){
                _loadPicker(ImageSource.gallery);
              },
            ),

            ListTile(
              title: Text("Сделайте фото"),
              onTap: (){
                _loadPicker(ImageSource.camera);
              },
            )
          ],
        )
      )
    );
  }
}