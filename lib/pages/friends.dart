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

class Friend extends StatefulWidget {
  const Friend({Key? key}) : super(key: key);

  @override
  State<Friend> createState() => _Friend();
}


String searchQuery = "Search query";

class _Friend extends State<Friend> {

  late TextEditingController controller;

  List<Widget> listFriends = [];

  List listFriendsData = [
    "Vanya",
    "Петя",
    "Геша",
    "Гоша",
    "Кеша",
    "Гена",
    "Саня",
    "Маня",
    "Таня",
    "Даня",
    "Тамирлан",
    "Геша",
    "Гоша",
    "Кеша",
    "Гена",
    "Саня",
    "Маня",
    "Таня",
    "Даня",
    "Тамирлан"
  ];

  var searchName = "";

  void createFriendCard(context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    for (String name in listFriendsData) {
      var friend = Column(
        children: [
          Container(
            height: width * 0.244,
            width: width * 0.869,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF7F7F7),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(width * 0.05),
                )
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: width * 0.007)),
                  Container(
                    width: width * 0.192,
                    height: width * 0.192,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(90)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * 0.205,
                          height: width * 0.108,
                          child: Image.asset(
                            "assets/images/camera-to-take-photos.png",
                          )
                        )
                      ]
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: width * 0.0615)),
                  SizedBox(
                    width: width * 0.410,
                    height: width * 0.0615,
                    child: AutoSizeText(
                      name,
                      style: TextStyle(fontSize: 70, color: Colors.black),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: width * 0.016)),
                  SizedBox(
                    width: width * 0.086,
                    height: width * 0.086,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0x00ffffff),
                        elevation: 0.0,
                        padding: EdgeInsets.all(0.0)),
                      onPressed: () {},
                      child: Container(
                        width: width * 0.086,
                        height: width * 0.86,
                        child: Image.asset("assets/icons/chat-balloon_c_2.png")
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: width * 0.03,
          )
        ],
      );
      setState(() {
        listFriends.add(friend);
      });

    } 
  }

  @override
  void initState() {
    new Future.delayed(Duration.zero,() {
        createFriendCard(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: 200,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  viewMyFriend(width, height, context);
                },
                child: Text('Друзья'),
              ),
            )
          ]
        ),
      ),
    );
  }

  void viewMyFriend(width, height, context){
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
      context: context,
      pageBuilder: (_, __, ___) {
        return Column(
          children: [
            Padding(padding: EdgeInsets.only(top: height * 0.12)),

            /// ТУТ РАБОТАЮ \\\
            Container(
              width: width,
              height: height * 0.88,
              decoration: (BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width * 0.05),
                  topRight: Radius.circular(width * 0.05)))),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, height * 0.022, 0, 0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: width * 0.0584)),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.285,
                            height: width * 0.107,
                            child: const AutoSizeText(
                              'Друзья',
                              style: TextStyle(
                                color: Color(0xFF4A1A78),
                                fontSize: 70,
                                fontFamily: "Comfortaa",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Padding(padding: EdgeInsets.only(left: width * 0.073)),

                          // Image.asset("assets/icons/search.png", width: width * 0.0608, height: width * 0.0608),
                          // Padding(padding: EdgeInsets.only(left: height * 0.01)),

                          // Stack(
                          //   children: [
                          //     Container(
                          //       // width: width * 0.5203,
                          //       width: width * 0.4388,
                          //       height: width * 0.107,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(width * 0.038),
                          //         color: Color(0x66D9D9D9)
                          //       ),
                          //     ),

                          //     Positioned(
                          //       left: 10,
                          //       child: SizedBox(
                          //         width: width * 0.4003,
                          //         height: width * 0.107,
                          //         child: TextField(

                          //           controller: controller,

                          //           onChanged: (value) => {
                          //             setState(() => searchName = value),
                          //           },

                          //             decoration: const InputDecoration(
                          //             counterText: '',
                          //             border: OutlineInputBorder(
                          //               borderSide: BorderSide(
                          //                 width: 0,
                          //                 style: BorderStyle.none
                          //               ),
                          //             )
                          //           ),

                          //           textAlignVertical: TextAlignVertical.center,
                                    
                          //           style: const TextStyle(
                          //             color: Color(0xFF9A68C2),
                          //             fontSize: 17,
                          //             fontWeight: FontWeight.bold,
                          //             fontFamily: "assets/fonts/Inter-Thin.ttf"
                          //           ),

                          //           maxLength: 15,
                                    
                          //         ),
                          //       )
                          //     ),

                              // Positioned(
                              //   top: width * 0.0231,
                              //   right: width * 0.0207,
                              //   child: Image.asset("assets/icons/search.png", width: width * 0.0608, height: width * 0.0608)
                              // )
                            // ],
                          // ),
                        ],
                      )
                    ],
                  ),

                  /// ТУТ РАБОТАЮ \\\
                  // Padding(padding: EdgeInsets.only(top: height * 0.02)),
                  // viewMyFriendList(context, listFriends)
                ],
              ),
            )
          ],
        );
      }
    );
  }

  Widget viewMyFriendList(context, listFriends) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return SizedBox(
      width: width,
      height: height * 0.78,
      child: SingleChildScrollView(
        child: Column(
          children: listFriends,
        ),
      ),
    );
  }

}

