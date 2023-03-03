import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vkurse_app/data/api_account_data.dart';
import 'package:vkurse_app/pages/auth_get_verification_code.dart';
import '../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart';

// Класс для отображения страницы перехода к боту

class InputUsername extends StatefulWidget {

  const InputUsername({Key? key}) : super(key: key);
  
  @override
  State<InputUsername> createState() => _InputUsername();

}

class _InputUsername extends State<InputUsername> {
  late TextEditingController controller;
  bool isButtonActive = false;
  bool isNicknameUniq = false;

  @override
  void initState(){
    super.initState();

    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;

      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose(){
    controller.dispose();

    super.dispose();
  }


  late String field_phone_number;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var buttonWidth = width * 0.65;
    var buttonHeight = buttonWidth * 0.20;

    double fontSizeButton = 16.0;
    double fontSizeText = 20.0;
    double fontSizeErrorText = 20.0;

    if(width <= 300)
    {
        fontSizeText = 14.0;
        fontSizeErrorText = 10.0;
        fontSizeButton = 16.0;
    }
    else if (width > 300 && width <= 700) 
    {
        fontSizeText = 16.0;
        fontSizeErrorText = 15.0;
        fontSizeButton = 20.0;
    }
    else if (width > 700 && width <= 1000) 
    {
        fontSizeText = 25.0;
        fontSizeErrorText = 23.0;
        fontSizeButton = 30.0;
    }
    else if (width > 1000) 
    {
        fontSizeText = 35.0;
        fontSizeErrorText = 25.0;
        fontSizeButton = 35.0;
    }

      var borderStyle = OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    );
            
      var borderErrorStyle = OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    );

      var textErrorStyle = TextStyle(
                            color: Colors.redAccent,
                            fontSize: fontSizeErrorText,
                            fontWeight: FontWeight.bold
                          );

      var textRegStyle = TextStyle(
                            color: Color(0xFF6F2EAE),
                            fontSize: 50,
                            fontWeight: FontWeight.bold 
                          );

      var textProfileStyle = TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                              );

      var textMarkStyle = TextStyle(
                            color: Color.fromARGB(100, 0, 0, 0),
                            fontSize: fontSizeErrorText,
                            fontWeight: FontWeight.bold
                          );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            //!\\\ (КОНЕЦ) ///\\\ ЛОГО ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ ПЕРЕХОД К БОТУ (ТЕКСТ + КНОПКА) ///\\\
            

            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.35,
                    height: width * 0.35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage("assets/images/check.jpg"))
                    ),
                  )
                ],
              )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                  height: width * 0.18,
                  child: AutoSizeText(
                    "Регистрация успешно\nпройдена!",
                    style: textRegStyle,
                  textAlign: TextAlign.center,
                  ),
                )
              ],
            ),

            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.7,
                        height: width * 0.09,
                        child: AutoSizeText(
                          "Пора настроить Ваш профиль",
                          style: textProfileStyle,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ), 
                                            
                      SizedBox(
                        width: width * 0.74,
                        child: TextField(
                          controller: controller,
                          onChanged: (val) async {
                            var username = await AccountDataApi.check_username(val, context);
                              setState(() => isNicknameUniq = username);
                          },

                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSizeText + 4
                          ),
                          decoration: InputDecoration(

                            errorText: isNicknameUniq? "*Этот никнейм уже занят" : "*Его будут видеть Ваши друзья",
                            errorStyle: isNicknameUniq? textErrorStyle : textMarkStyle,
                            errorBorder: isNicknameUniq? borderErrorStyle : borderStyle,
                            focusedErrorBorder: isNicknameUniq? borderErrorStyle : borderStyle,

                            labelText: "Имя пользователя",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: fontSizeText + 4,
                              fontWeight: FontWeight.bold,
                            ),

                            hintText: "",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: fontSizeText
                            ),

                            filled: true,
                            fillColor: Color(0xFFF9F9F9)
                          ),
                        ),
                      ),  
                                      
                      // Padding(padding: EdgeInsets.only(left: width * 0.13)),

                      // Visibility(
                      //   child: SizedBox(
                      //     width: width * 0.6,
                      //     height: width * 0.065,
                      //     child: AutoSizeText(
                      //         "*Его будут видеть Ваши друзья",
                      //         style: textMarkStyle,
                      //         // textAlign: TextAlign.center,
                      //         maxLines: 1,
                      //     ), 
                      //   ),
                      //    maintainSize: isNicknameUniq? false : true, 
                      //    maintainAnimation: true,
                      //    maintainState: true,
                      //    visible: isNicknameUniq? false : true, 
                      // )
                      
                    ],
                  )
                ],
              )
            ),

            // Padding(padding: EdgeInsets.only(top: 0.08)),

            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          onPressed: (isButtonActive && !isNicknameUniq)? (){

                          } 
                          : null,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            backgroundColor: (isButtonActive && !isNicknameUniq)? MaterialStateProperty.all<Color>(Color(0xFF6F2EAE))
                            : MaterialStateProperty.all<Color>(Color(0xFFA0A0A0))
                            ),

                            child:
                            AutoSizeText(
                                'Продолжить',
                                style: TextStyle(
                                  fontSize: fontSizeButton,
                                  fontFamily: "assets/fonts/Inter-Regular.ttf",
                                  fontWeight: FontWeight.bold),
                            )
                          ),
                        ),
                      ),
                    ],

                  )
                ],
              )
            )
          ],
        ),  
      ),
    );
  }
}