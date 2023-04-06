//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vkurse_app/pages/style/canvas.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

// import '../generated/locale_keys.g.dart';
// import 'package:vkurse_app/pages/style/canvas.dart';
// import 'package:vkurse_app/pages/auth_verification_code.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

// Класс для отображения страницы перехода к боту
class EndProfileFilling extends StatefulWidget {
  const EndProfileFilling({Key? key}) : super(key: key);

  @override
  State<EndProfileFilling> createState() => _EndProfileFilling();
}

class _EndProfileFilling extends State<EndProfileFilling> {
  // bool isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    var buttonWidth = width * 0.65;
    var buttonHeight = buttonWidth * 0.20;

    var widthText = width * 0.85;
    var heightText = widthText * 0.2;

    double fontSizeButton = 16.0;
    double fontSizeText = 20.0;
    double fontSizeErrorText = 20.0;

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

    var borderStyle = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(width * 0.0488)),
    );

    var borderErrorStyle = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(width * 0.0488)),
    );

    var textErrorStyle = TextStyle(
      color: Colors.redAccent,
      fontSize: fontSizeErrorText,
      fontWeight: FontWeight.bold,
      fontFamily: "assets/fonts/Inter-Regular.ttf",
    );

    var textRegStyle = const TextStyle(
      color: Color(0xFF6F2EAE),
      fontSize: 50,
      fontWeight: FontWeight.bold,
      fontFamily: "assets/fonts/Inter-Regular.ttf",
    );

    var textProfileStyle = const TextStyle(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.bold,
      fontFamily: "assets/fonts/Inter-Regular.ttf",
    );

    var textMarkStyle = TextStyle(
      color: Color.fromARGB(100, 0, 0, 0),
      fontSize: fontSizeErrorText,
      fontWeight: FontWeight.bold,
      fontFamily: "assets/fonts/Inter-Regular.ttf",
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

          Padding(padding: EdgeInsets.fromLTRB(0, width * 0.10, 0, 0)),

          ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

          // Container(
          //   width: width * 0.63,
          //   height: width * 0.63,
          //   decoration: BoxDecoration(
          //     image: const DecorationImage(
          //       image: AssetImage("assets/images/logo_pic.png"),
          //       opacity: 0.4,
          //   )),
          // ),

          SizedBox(
            width: width,
            height: height * 0.3,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: SizedBox(
                    width: width,
                    height: height * 0.3,
                    child: CustomPaint(
                      foregroundPainter: HeaderPainter(),
                    ),
                  ),
                ),
                Positioned(
                    left: width * 0.025,
                    child: SizedBox(
                        width: width * 0.2,
                        height: width * 0.2,
                        child: IconButton(
                          onPressed: () async {
                            await Navigator.pushNamed(context, '/auth');
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                          iconSize: width * 0.1,
                          color: Color(0xF0DADADA),
                        ))),
                Positioned(
                    child: Container(
                  height: width * 0.4,
                  width: width * 0.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/logo_pic_white.png"),
                    opacity: 0.4,
                  )),
                ))
              ],
            ),
          ),

          //!\\\ (КОНЕЦ) ///\\\ ЛОГО ///\\\

          //---------------------------------------------------------------------------------------------------------------------------------------\\

          ///\\\ (НАЧАЛО) ///\\\ ТЕКСТ ///\\\

          Padding(padding: EdgeInsets.fromLTRB(0, width * 0.043, 0, 0)),

          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: width * 0.580,
                          height: width * 0.062,
                          child: AutoSizeText('Настройка завершена!',
                              style: textRegStyle),
                        ),

                        Padding(
                            padding:
                                EdgeInsets.fromLTRB(0, width * 0.043, 0, 0)),

                        Row(
                          children: [
                            Container(
                              // color: Colors.amber,
                              width: width * 0.8,
                              height: width * 0.124,
                              child: AutoSizeText(
                                  'Теперь ты можешь пользоваться\n  всеми функциями приложения',
                                  style: textRegStyle),
                            )
                          ],
                        ),

                        Padding(
                            padding:
                                EdgeInsets.fromLTRB(0, width * 0.124, 0, 0)),

                        //!\\\ (КОНЕЦ) ///\\\ ТЕКСТ ///\\\

                        //---------------------------------------------------------------------------------------------------------------------------------------\\

                        ///\\\ (НАЧАЛО) ///\\\ КНОПКА "НАЧАТЬ" ///\\\

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
                                  width: width * 0.524,
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
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/map');
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * 0.039),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Color(0xFF6F2EAE))),
                                        child: AutoSizeText(
                                          'Начать',
                                          style: TextStyle(
                                              fontSize: fontSizeButton,
                                              fontFamily:
                                                  "assets/fonts/Inter-Regular.ttf",
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: width * 0.25,
                                ),
                              ],
                            )
                          ],
                        )),
                        //!\\\ (КОНЕЦ) ///\\\ КНОПКА "НАЧАТЬ" ///\\\
                      ]),
                ]),
          )
        ])));
  }
}
