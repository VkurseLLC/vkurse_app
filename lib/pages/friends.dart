// //?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

// import 'dart:js';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:image_picker/image_picker.dart';
import 'package:vkurse_app/pages/style/canvas.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

void viewMyFriends(context, width, height, listFriends) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context)
        .modalBarrierDismissLabel,
    context: context,
    pageBuilder: (_, __, ___) {
      return Column(
        children: [
          Padding(padding: EdgeInsets.only(top: height * 0.12)),
          Container(
            width: width,
            height: 0.88 * height,
            decoration: (BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * 0.05),
                    topRight: Radius.circular(width * 0.05)))),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, height * 0.022, 0, 0)),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.09)),
                    Container(
                      height: height * 0.043,
                      width: width * 0.285,
                      child: AutoSizeText(
                        'Друзья',
                        style: TextStyle(fontSize: 70),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding:
                        EdgeInsets.only(top: height * 0.027)),
                Container(
                  width: width,
                  height: height * 0.786,
                  child: SingleChildScrollView(
                    child: Column(
                      children: listFriends,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
}