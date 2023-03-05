import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vkurse_app/data/api_auth.dart';
import 'package:vkurse_app/pages/auth_phone_number.dart';
import '../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Класс для отображения страницы перехода к боту
class EndProfileFilling extends StatefulWidget {
  const EndProfileFilling({Key? key}) : super(key: key);

  @override
  State<EndProfileFilling> createState() => _EndProfileFilling();
}

class _EndProfileFilling extends State<EndProfileFilling> {
  // bool isButtonActive = false;

  late String field_1_verification_code;
  late String field_2_verification_code;
  late String field_3_verification_code;
  late String field_4_verification_code;
  late String field_5_verification_code;

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
          ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

          Padding(padding: EdgeInsets.fromLTRB(0, width * 0.10, 0, 0)),

          ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

          Container(
            width: width * 0.63,
            height: width * 0.63,
            decoration: BoxDecoration(
                image: const DecorationImage(
              image: AssetImage("assets/images/logo_pic.png"),
              opacity: 0.4,
            )),
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
                  Column(children: [
                    Row(
                      children: [
                        Text('Настройка завершена!',
                            style: TextStyle(
                                color: Color.fromRGBO(111, 46, 174, 0.9),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),

                    Padding(
                        padding: EdgeInsets.fromLTRB(0, width * 0.043, 0, 0)),

                    Row(
                      children: [
                        Text(
                            'Теперь ты можешь позьзоваться\n всеми функциями приложения',
                            style: TextStyle(
                                color: Color.fromRGBO(111, 46, 174, 0.9),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),

                    Padding(
                        padding: EdgeInsets.fromLTRB(0, width * 0.124, 0, 0)),

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
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xFF6F2EAE))),
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
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0, width * 0.25, 0, 0)),
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
