//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import 'package:vkurse_app/pages/style/canvas.dart';
import '../custom_package/src/utils/phone_number.dart';
import '../custom_package/src/utils/selector_config.dart';
import '../custom_package/src/widgets/input_widget.dart';
// import 'package:vkurse_app/pages/auth_verification_code.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\


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


    double phoneText = 0.0;

    if(width <= 300)
    {

      phoneText = 10.0;

    }
    else if (width > 300 && width <= 500) 
    {

      phoneText = 16.0;

    }
    else if (width > 500 && width <= 700) 
    {

      phoneText = 18.0;

    }
    else if (width > 700 && width <= 850) 
    {

      phoneText = 35.0;

    }
    else if (width > 850 && width <= 1000) 
    {

      phoneText = 40.0;

    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                Expanded(child:
                  Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: width * 0.7385,
                              height: width * 0.1783,
                              child: const AutoSizeText(
                                "Bведите номер\nтелефона",
                                style: TextStyle(
                                  color: Color(0xF0894EB8),
                                  fontSize: 60, 
                                  fontFamily: "Comfortaa",
                                  ),
                                maxLines: 2,
                                textAlign: TextAlign.left,
                              ),
                            ),
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
                                      textAlignVertical: TextAlignVertical.top,
                                      textStyle: TextStyle(
                                        fontSize: phoneText,
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
                                        fontSize: phoneText,
                                        fontFamily: "Comfortaa"
                                      ),
                                      textFieldController: controller,
                                      formatInput: false,
                                      maxLength: _PhoneNumberLength,
                                      keyboardType:TextInputType.numberWithOptions(signed: true, decimal: true),
                                      cursorColor: Colors.black,

                                      inputDecoration: InputDecoration(                                
                                        border: InputBorder.none,
                                        hintText: '(999) 999-99-99',
                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade500, 
                                          fontFamily: "Comfortaa",
                                          fontSize: phoneText
                                        ),
                                      ),

                                      // onSaved: (PhoneNumber number) {
                                      //   print('On Saved: $number');
                                      // },
                                    ),

                                    Positioned(
                                      left: width * 0.187,
                                      top: width * 0.0155,
                                      bottom: width * 0.0155,
                                      child: Container(
                                        height: width * 0.1973,
                                        width: width * 0.0024,
                                        color: Colors.black.withOpacity(0.18),
                                      ),
                                    )
                                  ],
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