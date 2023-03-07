import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:vkurse_app/data/api_auth.dart';
import 'package:vkurse_app/pages/auth_phone_number.dart';

import '../generated/locale_keys.g.dart';

// Класс для отображения страницы перехода к боту
class AuthVerificationCode extends StatefulWidget {
  const AuthVerificationCode({Key? key}) : super(key: key);

  @override
  State<AuthVerificationCode> createState() => _AuthVerificationCodeState();
}

class _AuthVerificationCodeState extends State<AuthVerificationCode> {
  // bool isButtonActive = false;

  var textEditingController = TextEditingController();
  String currentText = "";

  late String field_1_verification_code;
  late String field_2_verification_code;
  late String field_3_verification_code;
  late String field_4_verification_code;
  late String field_5_verification_code;

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
    double fontSizeMiniText = 15.0;
    double fontSizeErrorText = 20.0;

    if (width <= 300) {
      fontSizeMiniText = 15.0;
      fontSizeText = 18.0;
      fontSizeButton = 16.0;
    } else if (width > 300 && width <= 700) {
      fontSizeMiniText = 16.0;
      fontSizeText = 22.0;
      fontSizeButton = 20.0;
    } else if (width < 300) {
      fontSizeMiniText = 12.0;
      fontSizeText = 14.0;
      fontSizeButton = 20.0;
    } else if (width > 700 && width <= 1000) {
      fontSizeMiniText = 27.0;
      fontSizeText = 35.0;
      fontSizeButton = 30.0;
      widthText = width * 0.65;
      heightText = widthText * 0.2;
      buttonHeight = buttonWidth * 0.15;
    } else if (width > 1000) {
      fontSizeMiniText = 30.0;
      fontSizeText = 40.0;
      fontSizeButton = 30.0;
      widthText = width * 0.65;
      heightText = widthText * 0.2;
      buttonHeight = buttonWidth * 0.15;
    }

    var borderStyle = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );

    var borderErrorStyle = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(20)),
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
        child: Column(
          children: [
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
                          onPressed: () async {
                            await Navigator.pushNamed(
                                context, '/auth_get_verification_code');
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
                    padding: EdgeInsets.fromLTRB(
                        0, 0, width * 0.2 + width * 0.05, 0)),
              ],
            ),

            SizedBox(
              width: width * 0.2,
              height: width * 0.2,
            ),

            ////НАЧАЛО\\\\ ////ТЕКСТ\\\\

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          AutoSizeText('Введите код подтверждения',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: fontSizeText,
                                  fontFamily:
                                      "assets/fonts/Inter-Regular.ttf")),
                        ],
                      ),

                      ////КОНЕЦ\\\\ ////ТЕКСТ\\\\

                      Padding(padding: EdgeInsets.only(bottom: 10)),

                      ////НАЧАЛО\\\\ ////ПИН-КОД\\\\

                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.765,
                                height: width * 0.14,
                                child: PinCodeTextField(
                                  textStyle: TextStyle(color: Colors.black),
                                  length: 5,
                                  obscureText: false,
                                  animationType: AnimationType.fade,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    inactiveFillColor: Colors.grey.shade100,
                                    selectedFillColor: Colors.grey.shade100,
                                    selectedColor: Colors.grey.shade600,
                                    activeColor: Colors.grey.shade600,
                                    errorBorderColor: Colors.grey,
                                    inactiveColor: Colors.grey,
                                    fieldHeight: width * 0.1385,
                                    fieldWidth: width * 0.1385,
                                    activeFillColor: Colors.white,
                                  ),
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                  backgroundColor: Colors.white,
                                  enableActiveFill: true,
                                  controller: textEditingController,
                                  onCompleted: (v) {
                                    debugPrint("Completed");
                                  },
                                  onChanged: (value) {
                                    debugPrint(value);
                                    setState(() {
                                      currentText = value;
                                    });
                                  },
                                  beforeTextPaste: (text) {
                                    return true;
                                  },
                                  appContext: context,
                                ),
                              )
                            ],
                          ),

                          ////КОНЕЦ\\\\ ////ПИН-КОД\\\\

                          Padding(padding: EdgeInsets.only(top: 10)),

                          ////НАЧАЛО\\\\ ////ТЕКСТ\\\\

                          AutoSizeText(
                            '*код был отправлен Вам в нашем \nтелеграмм-боте',
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: fontSizeMiniText,
                                fontFamily: "assets/fonts/Inter-Regular.ttf"),
                          ),

                          ////КОНЕЦ\\\\ ////ТЕКСТ\\\\
                        ],
                      ),

                      ////НАЧАЛО\\\\ ////КНОПКА\\\\

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
                                      onPressed: () async {
                                        var prefs = await SharedPreferences
                                            .getInstance();
                                        var phone_number =
                                            prefs.getString('phone_number');
                                        var verification_code =
                                            "$field_1_verification_code$field_2_verification_code$field_3_verification_code$field_4_verification_code$field_5_verification_code";

                                        print('phone_number:');
                                        print(phone_number);
                                        print("verification_code:");
                                        print(verification_code);

                                        await AuthApi.user_authorisation(
                                            phone_number,
                                            verification_code,
                                            context);
                                      },
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
                                        'Продолжить',
                                        style: TextStyle(
                                            fontSize: fontSizeButton,
                                            fontFamily:
                                                "assets/fonts/Inter-Regular.ttf",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: width * 0.25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ////КОНЕЦ\\\\ ////КНОПКА\\\\
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
