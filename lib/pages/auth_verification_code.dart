import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

// Класс для отображения страницы перехода к боту
final _url = Uri.parse("https://t.me/VkurseAppBot");

void _launchUrl(_url) async {
  if (await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class Pincode extends StatefulWidget {
  const Pincode({Key? key}) : super(key: key);

  @override
  State<Pincode> createState() => _Pincode();
}

class _Pincode extends State<Pincode> {
  // bool isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var buttonWidth = width * 0.65;
    var buttonHeight = buttonWidth * 0.20;

    var widthText = width * 0.85;
    var heightText = widthText * 0.2;
    double fontSizeButton = 16.0;
    double fontSizeText = 20.0;

    if (width <= 300) {
      fontSizeText = 22.0;
      fontSizeButton = 16.0;
    } else if (width > 300 && width <= 700) {
      fontSizeText = 30.0;
      fontSizeButton = 20.0;
    } else if (width > 700 && width <= 1000) {
      fontSizeText = 35.0;
      fontSizeButton = 30.0;
      widthText = width * 0.65;
      heightText = widthText * 0.2;
      buttonHeight = buttonWidth * 0.15;
    } else if (width > 1000) {
      fontSizeText = 40.0;
      fontSizeButton = 30.0;
      widthText = width * 0.65;
      heightText = widthText * 0.2;
      buttonHeight = buttonWidth * 0.15;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          ///\\\ (НАЧАЛО) ///\\\ ИКОНКА "НАЗАД" ///\\\

          Padding(padding: EdgeInsets.fromLTRB(0, width * 0.05, 0, 0)),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0)),
              Column(
                children: [
                  Container(
                      width: width * 0.2,
                      height: width * 0.2,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0x26A0A0A0),
                          blurRadius: 20,
                        )
                      ]),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/auth");
                        },
                        icon: const Icon(Icons.arrow_back_ios_new),
                        iconSize: width * 0.1,
                        color: Color(0xFFA8A8A8),
                      ))
                ],
              ),
              Expanded(
                  child: Column(
                children: [
                  Container(
                    height: width * 0.35,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                      image: AssetImage("assets/images/logo_pic.png"),
                      opacity: 0.4,
                    )),
                  )
                ],
              )),
              Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, 0, width * 0.2 + width * 0.05, 0)),
            ],
          ),

          //!\\\ (КОНЕЦ) ///\\\ ИКОНКА "НАЗАД" ///\\\

          //---------------------------------------------------------------------------------------------------------------------------------------\\

          ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

          SizedBox(
            width: width * 0.2,
            height: width * 0.2,
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Column(
            //       children: [
            //         Container(
            //           height: width * 0.35,
            //           width: width * 0.35,
            //           decoration: BoxDecoration(
            //               image: const DecorationImage(
            //                 image: AssetImage("assets/images/logo_pic.png"),
            //                 opacity: 0.4,
            //               )
            //           ),
            //         )
            //       ],
            //     )
            //   ],
            // )
          ),

          //!\\\ (КОНЕЦ) ///\\\ ЛОГО ///\\\

          //---------------------------------------------------------------------------------------------------------------------------------------\\

          ///\\\ (НАЧАЛО) ///\\\ ПЕРЕХОД К БОТУ (ТЕКСТ + КНОПКА) ///\\\

          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text('Введите код подтверждения',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    children: [
                      //ПАНЕЛЬКА ВВОДА 1\\

                      Container(
                        width: 54,
                        height: 79,
                        child: Column(
                          children: [
                            Expanded(
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 1,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.0),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey.shade600,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey.shade600,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                  )),
                            )
                          ],
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(left: 7)),

                      //ПАНЕЛЬКА ВВОДА 2\\

                      Container(
                        width: 54,
                        height: 79,
                        child: Column(
                          children: [
                            Expanded(
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 1,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.0),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey.shade600,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey.shade600,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                  )),
                            )
                          ],
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(left: 7)),

                      //ПАНЕЛЬКА ВВОДА 3\\

                      Container(
                        width: 54,
                        height: 79,
                        child: Column(
                          children: [
                            Expanded(
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 1,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.0),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey.shade600,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey.shade600,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                  )),
                            )
                          ],
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(left: 7)),

                      //ПАНЕЛЬКА ВВОДА 4\\

                      Container(
                        width: 54,
                        height: 79,
                        child: Column(
                          children: [
                            Expanded(
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 1,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.0),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey.shade600,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey.shade600,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                  )),
                            )
                          ],
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(left: 7)),

                      //ПАНЕЛЬКА ВВОДА 5\\

                      Container(
                        width: 54,
                        height: 79,
                        child: Column(
                          children: [
                            Expanded(
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 1,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.0),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey.shade600,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey.shade600,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                  )),
                            )
                          ],
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(left: 7)),
                    ],
                  ),

                  //ПОДСКАЗКА\\

                  Text(
                    '*код был отправлен Вам в нашем \nтелеграмм-боте',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                  ),
                ],
              )
            ],
          )),

          //!\\\ (КОНЕЦ) ///\\\ ПЕРЕХОД К БОТУ (ТЕКСТ + КНОПКА) ///\\\

          //---------------------------------------------------------------------------------------------------------------------------------------\\

          ///\\\ (НАЧАЛО) ///\\\ КНОПКА "ПРОДОЛЖИТЬ" ///\\\

          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: buttonWidth,
                    height: buttonHeight,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(70, 0, 0, 0),
                            blurRadius: 25,
                            offset: Offset(0.0, 10.0)),
                      ],
                    ),
                    child: Opacity(
                      opacity: 0.9,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF6F2EAE))),
                          child: AutoSizeText(
                            'Продолжить',
                            style: TextStyle(
                                fontSize: fontSizeButton,
                                fontFamily: "assets/fonts/Inter-Regular.ttf",
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.25,
                  )
                ],
              )
            ],
          )),
          //!\\\ (КОНЕЦ) ///\\\ КНОПКА "ПРОДОЛЖИТЬ" ///\\\
        ]),
      ),
    );
  }
}
