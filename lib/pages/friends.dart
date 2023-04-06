// //?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
// //_____________________________________________СИСТЕМНЫЕ________________________________________________\\

// //_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:shared_preferences/shared_preferences.dart';

// //_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:validators/sanitizers.dart';
import 'package:vkurse_app/data/api_account_data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:vkurse_app/pages/style/canvas.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  State<Friends> createState() => _Friends();
}

TextEditingController _searchQueryController = TextEditingController();
bool _isSearching = false;
String searchQuery = "Search query";

double fontSizeErrorText = 20.0;

// final mediaQuery = MediaQuery.of(context);
// var width = mediaQuery.size.width;
// var textheight = mediaQuery.size.height;
// var height = mediaQuery.size.height;

class _Friends extends State<Friends> {
  final _formKey = GlobalKey<FormState>();

  // List<Widget> listFriends = [
  //   Container(
  //     height: width * 0.244,
  //     width: width * 0.869,
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //           backgroundColor: Color(0xffF7F7F7),
  //           shape: RoundedRectangleBorder(
  //             side: BorderSide(color: Colors.white),
  //             borderRadius: BorderRadius.circular(width * 0.05),
  //           )),
  //       onPressed: () {},
  //       child: Row(
  //         children: [
  //           Padding(padding: EdgeInsets.only(left: width * 0.007)),
  //           Container(
  //             width: width * 0.192,
  //             height: width * 0.192,
  //             decoration: BoxDecoration(
  //                 color: Colors.grey.shade400,
  //                 borderRadius: BorderRadius.circular(90)),
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   SizedBox(
  //                       width: width * 0.205,
  //                       height: width * 0.108,
  //                       child: Image.asset(
  //                         "assets/images/camera-to-take-photos.png",
  //                       ))
  //                 ]),
  //           ),
  //           Padding(padding: EdgeInsets.only(left: width * 0.0615)),
  //           Container(
  //             width: width * 0.410,
  //             height: width * 0.0615,
  //             child: AutoSizeText(
  //               "Толя",
  //               style: TextStyle(fontSize: 70, color: Colors.black),
  //             ),
  //           ),
  //           Padding(padding: EdgeInsets.only(left: width * 0.016)),
  //           Container(
  //             width: width * 0.086,
  //             height: width * 0.086,
  //             child: ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color(0x00ffffff),
  //                     elevation: 0.0,
  //                     padding: EdgeInsets.all(0.0)),
  //                 onPressed: () {},
  //                 child: Container(
  //                     child: Image.asset(
  //                   "assets/icons/chat-balloon_c_2.png",
  //                   width: width * 0.086,
  //                   height: width * 0.86,
  //                 ))
  //                 //  Image.asset(
  //                 //   "assets/icons/chat-balloon_c_2.png",
  //                 //   height: width * 0.064,
  //                 //   width: width * 0.064,
  //                 // )
  //                 ),
  //           )
  //         ],
  //       ),
  //     ),
  //   ),
  // ];

  void createFriendCard(double width, double height) {}

  @override
  void initState() {
    createFriendCard(411.4, 866.3);
    createFriendCard(411.4, 866.3);
    createFriendCard(411.4, 866.3);
  }

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var textheight = mediaQuery.size.height;
    var height = mediaQuery.size.height;

    var borderStyle = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x0F000000), width: 2),
      borderRadius: BorderRadius.all(Radius.circular(width * 0.039)),
    );

    var buttonStyle = ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFFE0E3E7)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.039),
          ),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(color: Color(0x0F000000), width: 2),
        ));

    var borderErrorStyle = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(width * 0.039)),
    );

    var textErrorStyle = TextStyle(
        color: Colors.redAccent,
        fontSize: fontSizeErrorText,
        fontWeight: FontWeight.bold);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
            width: 200,
            height: 100,
            child: ElevatedButton(
              onPressed: () {
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
                                      children: [
                                        Container(
                                          height: width * 0.244,
                                          width: width * 0.869,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xffF7F7F7),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.05),
                                                )),
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.007)),
                                                Container(
                                                  width: width * 0.192,
                                                  height: width * 0.192,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90)),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                            width:
                                                                width * 0.205,
                                                            height:
                                                                width * 0.108,
                                                            child: Image.asset(
                                                              "assets/images/camera-to-take-photos.png",
                                                            ))
                                                      ]),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.0615)),
                                                Container(
                                                  width: width * 0.410,
                                                  height: width * 0.0615,
                                                  child: AutoSizeText(
                                                    "Толя",
                                                    style: TextStyle(
                                                        fontSize: 70,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.016)),
                                                Container(
                                                  width: width * 0.086,
                                                  height: width * 0.086,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00ffffff),
                                                              elevation: 0.0,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          0.0)),
                                                      onPressed: () {},
                                                      child: Container(
                                                          child: Image.asset(
                                                        "assets/icons/chat-balloon_c_2.png",
                                                        width: width * 0.086,
                                                        height: width * 0.86,
                                                      ))
                                                      //  Image.asset(
                                                      //   "assets/icons/chat-balloon_c_2.png",
                                                      //   height: width * 0.064,
                                                      //   width: width * 0.064,
                                                      // )
                                                      ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 20)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Text('Друзья'),
            ),
          )
        ]),
      ),
    );
  }
}
