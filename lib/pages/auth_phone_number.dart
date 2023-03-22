import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:vkurse_app/pages/auth_get_verification_code.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../custom_package/src/utils/phone_number.dart';
import '../custom_package/src/utils/selector_config.dart';
import '../custom_package/src/widgets/input_widget.dart';
import '../generated/locale_keys.g.dart';

// Класс для отображения страницы перехода к боту

class GetPhoneNumber extends StatefulWidget {

  const GetPhoneNumber({Key? key}) : super(key: key);
  
  @override
  State<GetPhoneNumber> createState() => _GetPhoneNumber();

}

class _GetPhoneNumber extends State<GetPhoneNumber> {

  bool isButtonActive = false;
  late TextEditingController controller;
  late String field_phone_number;

  late int _PhoneNumberLength = 10;

  String initialCountry = 'RU';
  PhoneNumber number = PhoneNumber(isoCode: 'RU');

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    controller.addListener(() {
      
    });
  }


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

    if(width <= 300)
    {
        fontSizeText = 16.0;
        fontSizeButton = 16.0;

    }
    else if (width > 300 && width <= 700) 
    {
        fontSizeText = 22.0;
        fontSizeButton = 20.0;

    }
    else if (width > 700 && width <= 1000) 
    {
        fontSizeText = 26.0;
        fontSizeButton = 30.0;
        widthText = width * 0.65;
        heightText = widthText * 0.2;
        buttonHeight = buttonWidth * 0.15;
    }
    else if (width > 1000) 
    {
        fontSizeText = 30.0;
        fontSizeButton = 30.0;
        widthText = width * 0.65;
        heightText = widthText * 0.2;
        buttonHeight = buttonWidth * 0.15;
    }

    print('width: $width');
    print('height: $height');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
          children: [

             ///\\\ (НАЧАЛО) ///\\\ ИКОНКА "НАЗАД" + ЛОГО ///\\\
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                            foregroundPainter: ShapePainter(),
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
                        // left: width * 0.325,
                        child: Container(
                          height: width * 0.4,
                          width: width * 0.4,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              // image: AssetImage("assets/images/logo_pic.png"),
                              // image: AssetImage("assets/images/logo_pic_gray.png"),
                              image: AssetImage("assets/images/logo_pic_white.png"),
                            opacity: 0.4,
                            )
                          ),
                        )
                      )
                    ],
                  ),
                ),
              ]
            ),

             //!\\\ (КОНЕЦ) ///\\\ ИКОНКА "НАЗАД" + ЛОГО ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

            SizedBox(
              width: width * 0.05,
              height: width * 0.05,
            ),

            //!\\\ (КОНЕЦ) ///\\\ ЛОГО ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ ПОЛЕ ДЛЯ ВВОДА НОМЕРА + ТЕКСТ ///\\\

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        child: AutoSizeText(
                          "Bведите номер\nтелефона",
                          style: TextStyle(
                            color: Color(0xF0894EB8),
                            fontSize: 30, 
                            fontFamily: "Comfortaa",
                            ),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),),

                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, width * 0.1)),
                      
                      ////////// ПОЛЕ ВВОДА НОМЕРА ТЕЛЕФОНА ////////// 
                      SizedBox(
                        width: width * 0.75,
                        height: (width * 0.7) * 0.23,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 15),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(width * 0.0488),
                            border: Border.all(
                              color: Color(0xF0894EB8),
                              width: 2
                            ),

                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              const BoxShadow(
                                color: Color(0xffeeeeee),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),

                          
                          child: Stack(
                            children: [
                              InternationalPhoneNumberInput(
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Comfortaa"
                                ),

                                onInputChanged: (PhoneNumber number) {
                                  field_phone_number = "${number.phoneNumber}";
                                },
                                
                                onInputValidated: (bool value) {
                                },

                                selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                ),

                                locale: "ru",
                                countries: ["RU", "UA", "KZ", "BY"],
                                initialValue: number,
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "Comfortaa"
                                ),
                                textFieldController: controller,
                                formatInput: false,
                                maxLength: _PhoneNumberLength,
                                keyboardType:TextInputType.numberWithOptions(signed: true, decimal: true),
                                cursorColor: Colors.black,
                                
                                inputDecoration: InputDecoration(                                
                                  // contentPadding: EdgeInsets.only(bottom: 15, left: 0),
                                  border: InputBorder.none,
                                  hintText: '(999) 999-99-99',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade500, 
                                    fontFamily: "Comfortaa",
                                    fontSize: 18
                                  ),
                                ),

                                // onSaved: (PhoneNumber number) {
                                //   print('On Saved: $number');
                                // },
                              ),

                              Positioned(
                                left: width * 0.219,
                                top: width * 0.0195,
                                bottom: width * 0.0195,
                                child: Container(
                                  height: width * 0.0973,
                                  width: width * 0.0024,
                                  color: Colors.black.withOpacity(0.13),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //!\\\ (КОНЕЦ) ///\\\ ПОЛЕ ДЛЯ ВВОДА НОМЕРА + ТЕКСТ ///\\\
            
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
                        width: width * 0.7007,
                        height: width * 0.1338,
                        
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
                          onPressed:() async {

                            // В переменной > field_phone_number < хранится то, что ввел пользователь

                            var prefs = await SharedPreferences.getInstance();
                            prefs.setString('phone_number', field_phone_number);

                            await Navigator.pushNamed(context, '/auth_get_verification_code');
                          }, 
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(width * 0.039),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xF0894EB8))
                            ),

                            child: 
                            SizedBox(
                              width: width * 0.7,
                              height: width * 0.0784,
                              child: const AutoSizeText(
                                'Продолжить',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: "Comfortaa",
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.25,
                      )
                    ],
                  )
                ],
              )
            ),
            //!\\\ (КОНЕЦ) ///\\\ КНОПКА "ПРОДОЛЖИТЬ" ///\\\

          ]
      ),
    );
  }
}

class ShapePainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {

  Paint paint0 = Paint()
      ..color = Color(0xF0894EB8)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(size.width,0);
    path0.lineTo(size.width,size.height*0.80);
    path0.quadraticBezierTo(size.width*0.8434750,size.height*1.0186800,size.width*0.50,size.height);
    path0.quadraticBezierTo(size.width*0.1569500,size.height*1.0205600,0,size.height*0.8000000);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}