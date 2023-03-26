//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:auto_size_text/auto_size_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import '../generated/locale_keys.g.dart';
import 'package:vkurse_app/data/api_auth.dart';
import 'package:vkurse_app/pages/style/canvas.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\


class AuthVerificationCode extends StatefulWidget {

  const AuthVerificationCode({Key? key}) : super(key: key);
  
  @override
  State<AuthVerificationCode> createState() => _AuthVerificationCode();

}

class _AuthVerificationCode extends State<AuthVerificationCode> {

@override
Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    double fontSizeText = 16.0;

    if (width <= 300) {

      fontSizeText = 16.0;

    } 
    else if (width > 300 && width <= 500) 
    {

      fontSizeText = 20.0;

    } 
    else if (width > 500 && width <= 700) 
    {

      fontSizeText = 25.0;

    } 
    else if (width > 700 && width <= 900) 
    {

      fontSizeText = 30.0;

    }
    else 
    {

      fontSizeText = 40.0;

    }

    var textEditingController = TextEditingController();
    String field_verification_code = "";

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
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
                        )
                      )
                    ),

                    Positioned(
                      child: Container(
                        height: width * 0.4,
                        width: width * 0.4,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo_pic_white.png"),
                          opacity: 0.4,
                          )
                        ),
                      )
                    )
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: width * 0.7385,
                              height: width * 0.1783,
                              child: const AutoSizeText(
                                "Bведите код подтверждения",
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xF0894EB8),
                                  fontSize: 60,
                                  fontFamily: "Comfortaa",
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        )
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width * 0.7385,
                              height: width * 0.141,
                              child: PinCodeTextField(

                                onCompleted: (v) {
                                  debugPrint("Completed");
                                },

                                onChanged: (value) {
                                  debugPrint(value);
                                  setState(() {
                                    field_verification_code = value;
                                  });
                                },

                                beforeTextPaste: (text) {
                                  return true;
                                },

                                keyboardType: TextInputType.phone,
                                length: 5,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                cursorColor: Colors.grey.shade800,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                enableActiveFill: true,
                                controller: textEditingController,
                                appContext: context,

                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(width * 0.0293)),
                                  inactiveFillColor: Colors.grey.shade100,
                                  selectedFillColor: Colors.grey.shade100,
                                  selectedColor: Color(0xFF894EB8),
                                  activeColor: Color(0xFF894EB8),
                                  errorBorderColor: Colors.redAccent,
                                  inactiveColor: Color(0xFF894EB8),
                                  fieldHeight: width * 0.1385,
                                  fieldWidth: width * 0.1385,
                                  activeFillColor: Colors.white,
                                ),
                                backgroundColor: Colors.white,

                                hintCharacter: "_",
                                hintStyle: TextStyle(
                                  color: Color(0xFF894EB8),
                                  fontSize: fontSizeText,
                                  fontFamily: "Comfortaa",
                                  fontWeight: FontWeight.bold,
                                ),
                                textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: fontSizeText,
                                  fontFamily: "Comfortaa"
                                ),

                              ),
                            )
                          ],
                        )
                      ),
                    ],
                  )
                )
              ],
            )
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.6538,
                  height: width * 0.1333,
                  
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(70, 0, 0, 0),
                        blurRadius: width * 0.0608,
                        offset: Offset(0.0, width * 0.0243)),
                    ],
                  ),

                  child: Opacity(
                    opacity: 0.9,
                    child: ElevatedButton(
                      
                      onPressed: () async {
                        var prefs = await SharedPreferences.getInstance();
                        var phone_number = prefs.getString('phone_number');
                        var verification_code = "$field_verification_code";

                        await AuthApi.user_authorisation(
                            phone_number,
                            verification_code,
                            context);
                      },

                     style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.039),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xF0894EB8))                  
                      ),

                      child: SizedBox(
                        width: width * 0.3692,
                        height: width * 0.0564,
                        child: const AutoSizeText(
                          'Продолжить',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ) 
          )
        ],
      ),
    );
  }
}