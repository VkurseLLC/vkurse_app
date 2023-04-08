// //?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:shared_preferences/shared_preferences.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:image_picker/image_picker.dart';
import 'package:vkurse_app/pages/style/canvas.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  State<Friends> createState() => _Friends();
}


String searchQuery = "Search query";

class _Friends extends State<Friends> {
  List<Widget> listFriends = [];

  List listFriendsData = [
    "Ваня",
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

  void createFriendCard(context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;

    for (String name in listFriendsData) {
      var friend = Container(
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
                      borderRadius: BorderRadius.circular(90)),

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
                      child: Image.asset("assets/icons/chat-balloon_c_2.png",)
                    )
                  ),
                )
              ],
            ),
          ),
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

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

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
                                      children: listFriends,
                                      // Container(
                                      //   height: width * 0.244,
                                      //   width: width * 0.869,
                                      //   child: ElevatedButton(
                                      //     style: ElevatedButton.styleFrom(
                                      //         backgroundColor:
                                      //             Color(0xffF7F7F7),
                                      //         shape: RoundedRectangleBorder(
                                      //           side: BorderSide(
                                      //               color: Colors.white),
                                      //           borderRadius:
                                      //               BorderRadius.circular(
                                      //                   width * 0.05),
                                      //         )),
                                      //     onPressed: () {},
                                      //     child: Row(
                                      //       children: [
                                      //         Padding(
                                      //             padding: EdgeInsets.only(
                                      //                 left: width * 0.007)),
                                      //         Container(
                                      //           width: width * 0.192,
                                      //           height: width * 0.192,
                                      //           decoration: BoxDecoration(
                                      //               color:
                                      //                   Colors.grey.shade400,
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       90)),
                                      //           child: Column(
                                      //               mainAxisAlignment:
                                      //                   MainAxisAlignment
                                      //                       .center,
                                      //               children: [
                                      //                 SizedBox(
                                      //                     width:
                                      //                         width * 0.205,
                                      //                     height:
                                      //                         width * 0.108,
                                      //                     child: Image.asset(
                                      //                       "assets/images/camera-to-take-photos.png",
                                      //                     ))
                                      //               ]),
                                      //         ),
                                      //         Padding(
                                      //             padding: EdgeInsets.only(
                                      //                 left: width * 0.0615)),
                                      //         Container(
                                      //           width: width * 0.410,
                                      //           height: width * 0.0615,
                                      //           child: AutoSizeText(
                                      //             "Толя",
                                      //             style: TextStyle(
                                      //                 fontSize: 70,
                                      //                 color: Colors.black),
                                      //           ),
                                      //         ),
                                      //         Padding(
                                      //             padding: EdgeInsets.only(
                                      //                 left: width * 0.016)),
                                      //         Container(
                                      //           width: width * 0.086,
                                      //           height: width * 0.086,
                                      //           child: ElevatedButton(
                                      //               style: ElevatedButton
                                      //                   .styleFrom(
                                      //                       backgroundColor:
                                      //                           Color(
                                      //                               0x00ffffff),
                                      //                       elevation: 0.0,
                                      //                       padding:
                                      //                           EdgeInsets
                                      //                               .all(
                                      //                                   0.0)),
                                      //               onPressed: () {},
                                      //               child: Container(
                                      //                   child: Image.asset(
                                      //                 "assets/icons/chat-balloon_c_2.png",
                                      //                 width: width * 0.086,
                                      //                 height: width * 0.86,
                                      //               ))
                                      //               //  Image.asset(
                                      //               //   "assets/icons/chat-balloon_c_2.png",
                                      //               //   height: width * 0.064,
                                      //               //   width: width * 0.064,
                                      //               // )
                                      //               ),
                                      //         )
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // Padding(
                                      //     padding: EdgeInsets.only(top: 20)),
                                      // ],
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
