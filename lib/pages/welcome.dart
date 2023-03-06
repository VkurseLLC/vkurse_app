import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vkurse_app/pages/auth_get_verification_code.dart';
import 'package:vkurse_app/pages/auth_phone_number.dart';
import '../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

void _launchUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

// Основной класс для отображения страницы авторизации - ввод номера
class AuthProvider extends StatefulWidget {
  const AuthProvider({Key? key}) : super(key: key);

  @override
  State<AuthProvider> createState() => _AuthProviderState();
}

class _AuthProviderState extends State<AuthProvider> {
  // Ниже нужно прописывать структуру виджетов
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    var buttonWidthEnter = width * 0.45;
    var buttonWidthTech = width * 0.65;
    var buttonHeightEnter = buttonWidthEnter * 0.28;
    var buttonHeightTech = buttonWidthTech * 0.20;

    var widthText = width * 0.85;
    var heightText = widthText * 0.2;
    double fontSizeButton = 16.0;
    double fontSizeText = 20.0;

    if (width <= 300) {
      fontSizeText = 14.0;
      fontSizeButton = 16.0;
    } else if (width > 300 && width <= 700) {
      fontSizeText = 16.0;
      fontSizeButton = 20.0;
    } else if (width > 700 && width <= 900) {
      fontSizeText = 20.0;
      fontSizeButton = 30.0;
      widthText = width * 0.65;
      heightText = widthText * 0.2;
    } else if (width > 900) {
      fontSizeText = 28.0;
      fontSizeButton = 30.0;
      widthText = width * 0.65;
      heightText = widthText * 0.2;
    }

    var textStyle = TextStyle(
      color: Colors.black,
      fontSize: fontSizeText,
      fontFamily: "assets/fonts/Inter-Bold.ttf",
    );

    var linkStyle = TextStyle(
        color: Color.fromARGB(255, 71, 122, 148),
        fontSize: fontSizeText,
        fontFamily: "assets/fonts/Inter-Bold.ttf",
        decoration: TextDecoration.underline,
        decorationColor: Color.fromARGB(255, 71, 122, 148),
        decorationThickness: 1.5);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          ///\\\ (НАЧАЛО) ///\\\ КОД С КАРТИНКАМИ (ЛОГО + НАЗВАНИЕ) ///\\\

          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: width * 0.35,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                        image: AssetImage("assets/images/logo_pic.png"),
                        opacity: 0.4,
                      )),
                    ),
                    Container(
                      height: height * 0.1,
                      width: width * 0.6,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                        image: AssetImage("assets/images/logo_text.png"),
                        opacity: 0.8,
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),

          //!\\\ (КОНЕЦ) ///\\\ КОД С КАРТИНКАМИ (ЛОГО + НАЗВАНИЕ) ///\\\

          //---------------------------------------------------------------------------------------------------------------------------------------\\

          ///\\\ (НАЧАЛО) ///\\\ КОД С КНОПКОЙ "ВХОД" ///\\\

          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: buttonWidthEnter,
                      height: buttonHeightEnter,
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
                              Navigator.pushNamed(
                                  context, '/auth_get_phone_number');
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF6F2EAE)),
                            ),
                            child: AutoSizeText(
                              'Вход',
                              style: TextStyle(
                                  fontSize: fontSizeButton,
                                  fontFamily: "assets/fonts/Inter-Regular.ttf",
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //!\\\ (КОНЕЦ) ///\\\ КОД С КНОПКОЙ "ВХОД" ///\\\

          //---------------------------------------------------------------------------------------------------------------------------------------\\

          ///\\\ (НАЧАЛО) ///\\\ КОД С КНОПКОЙ "ТЕХ. ПОДДЕРЖКА" ///\\\

          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: buttonWidthTech,
                      height: buttonHeightTech,
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
                          onPressed: null,
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF808080)), // Кнопка неактивна
                            // backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF350068)), // Кнопка активна
                          ),
                          child: AutoSizeText(
                            'Тех. Поддержка',
                            style: TextStyle(
                                fontSize: fontSizeButton,
                                fontFamily: "assets/fonts/Inter-Regular.ttf",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    Container(
                      width: widthText,
                      height: heightText,
                      child: AutoSizeText.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(
                                style: textStyle,
                                text: "Продолжая, ты соглашаешься с "),
                            TextSpan(
                              style: linkStyle,
                              text: "Условиями использования сервиса (Миро)",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  var url =
                                      "https://miro.com/app/board/uXjVP2mHHBQ=/";
                                  _launchUrl(url);
                                },
                            ),
                            TextSpan(style: textStyle, text: " и "),
                            TextSpan(
                              style: linkStyle,
                              text: "Политикой конфидециальности (Фигма)",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  var url =
                                      "https://www.figma.com/file/r24RH6sdCk6GNGtOAa6b0g/VKURSE?node-id=5%3A224&t=u2LWB78J9dDghFXf-0";
                                  _launchUrl(url);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: width * 0.15,
          )

          //!\\\ (КОНЕЦ) ///\\\ КОД С КНОПКОЙ "ТЕХ. ПОДДЕРЖКА"  ///\\\
        ],
      )),
    );
  }
}
