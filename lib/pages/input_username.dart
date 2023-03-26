//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:easy_localization/easy_localization.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import '../generated/locale_keys.g.dart';
import 'package:vkurse_app/data/api_account_data.dart';
// import 'package:vkurse_app/pages/style/canvas.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\


// Класс для отображения страницы ввода username

class InputUsername extends StatefulWidget {

  const InputUsername({Key? key}) : super(key: key);
  
  @override
  State<InputUsername> createState() => _InputUsername();

}

class _InputUsername extends State<InputUsername> {
  late TextEditingController controller;
  bool isButtonActive = false;
  bool isNicknameUniq = false;

  late String username_value = "" ;

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
                      borderRadius: BorderRadius.all(Radius.circular(width * 0.0488)),
                    );
            
      var borderErrorStyle = OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(width * 0.0488)),
                    );

      var textErrorStyle = TextStyle(
                            color: Colors.redAccent,
                            fontSize: fontSizeErrorText,
                            fontWeight: FontWeight.bold
                          );

      var textRegStyle = const TextStyle(
                            color: Color(0xFF6F2EAE),
                            fontSize: 50,
                            fontWeight: FontWeight.bold 
                          );

      var textProfileStyle = const TextStyle(
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

            ///\\\ (НАЧАЛО) ///\\\ ИКОНКА + ТЕКСТ "Регистрации" ///\\\

            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.35,
                    height: width * 0.35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/check.png"))
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

            //!\\\ (КОНЕЦ) ///\\\ ИКОНКА + ТЕКСТ "Регистрации" ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

             ///\\\ (НАЧАЛО) ///\\\ ТЕКСТ + ФОРМА ///\\\

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
                            username_value = val;
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

                            // hintText: "",
                            // hintStyle: TextStyle(
                            //   color: Colors.grey,
                            //   fontSize: fontSizeText
                            // ),

                            filled: true,
                            fillColor: Color(0xFFF9F9F9)
                          ),
                        ),
                      ),                  
                    ],
                  )
                ],
              )
            ),

            //!\\\ (КОНЕЦ) ///\\\ ТЕКСТ + ФОРМА ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ КНОПКА ///\\\

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

                        decoration: const BoxDecoration(
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
                          onPressed: (isButtonActive && !isNicknameUniq)? () async {
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setString('username', username_value);

                            await Navigator.pushNamed(context, '/initial_setting_accaunt_data');
                          } 
                          : null,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(width * 0.039),
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

            //!\\\ (КОНЕЦ) ///\\\ КНОПКА ///\\\

          ],
        ),  
      ),
    );
  }
}