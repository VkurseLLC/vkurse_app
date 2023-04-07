//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\



// Класс для отображения страницы ввода username

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

double fontSizeButton = 16.0;
double fontSizeText = 20.0;
double fontSizeMiniText = 15.0;
double fontSizeErrorText = 20.0;

class _Profile extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  static const textfield = [
    "Nikita",
    "Fomichev",
    "18лет",
    "Ростов-на-Дону",
    "+7-999-999-99-99",
    "@kratos0506",
    "Меня зовут Никита))) и я пользвуюсь VKURSE"
  ];
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
    color: Color(0xff4D4D4D),
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

  bool isDateSelected = false;

  DateTime dateTime = DateTime(DateTime.now().year - 20); // ЗДЕСЬ ХРАНИТСЯ ДАТА

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    double fontSizeOP = 18;
    if (width > 700 && width < 900) {
      fontSizeOP = 32;
    } else if (width < 300) {
      fontSizeOP = 16;
    } else if (width > 900) {
      fontSizeOP = 28;
    } else if (width > 300 && width < 500) {
      fontSizeOP = 18;
    } else if (width > 700 && width < 700) {
      fontSizeOP = 22;
    }

    final day = DateFormat('dd').format(dateTime);
    final month = DateFormat('MMMM', 'ru_RU').format(dateTime);
    final year = DateFormat('yyyy').format(dateTime);

    var borderStyle = const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x0F000000), width: 2),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );

    var buttonStyle = ButtonStyle(
      side: MaterialStateProperty.all(
        BorderSide(color: Color(0x0F000000), width: 2),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE0E3E7)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: width,
              height: height,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: width,
                    height: height * 0.5189,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/profilephoto.jpg"),
                    )),
                    child: Column(children: [
                      Padding(padding: EdgeInsets.only(top: height * 0.045)),
                      Container(
                        width: width * 0.851,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back_ios_new),
                              color: Color(0xFFffffff),
                              iconSize: width * 0.115,
                            ),
                            IconButton(
                              onPressed: () {
                                ///----------------------------------////ВСПЛЫВАЮЩЕЕ ОКНО\\\\\///НАЧАЛО\\\\-------------------------------------------------------------\\\\

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Color(0x00FFFFFF),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        contentPadding: EdgeInsets.all(0),
                                        insetPadding: EdgeInsets.fromLTRB(
                                            width * 0.2558,
                                            height * 0.1338,
                                            width * 0.0564,
                                            height * 0.2738),
                                        content: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            color: Color(0x00FFFFFF),
                                          ),
                                          width: width * 0.7077,
                                          height: width * 0.79,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //------------------------///ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НАСТРОЙКИ\\\\////НАЧАЛО\\-------------------------------\\

                                              Container(
                                                height: width * 0.146,
                                                width: width * 0.7077,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Colors
                                                                .white),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20))),
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                    foregroundColor:
                                                        Colors.black54,
                                                    shadowColor: Colors.white,
                                                    elevation: 0.0,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/settings.png',
                                                        height: width * 0.064,
                                                        width: width * 0.064,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: width *
                                                                      0.031)),
                                                      Container(
                                                        width: width * 0.2462,
                                                        height: width * 0.0564,
                                                        child: AutoSizeText(
                                                          "Настройки",
                                                          style: TextStyle(
                                                              fontSize: 100,
                                                              fontFamily:
                                                                  "assets/fonts/Inter-Regular.ttf",
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              //----------------------------------------///ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НАСТРОЙКИ\\\\////КОНЕЦ\\---------------------------\\

//-----------------------------------------//ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ВАШИ ДЕЙСТВИЯ\\\\////НАЧАЛО\\-------------------------------------\\

                                              Container(
                                                height: width * 0.146,
                                                width: width * 0.7077,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    0))),
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                    foregroundColor:
                                                        Colors.black54,
                                                    shadowColor: Colors.white,
                                                    elevation: 0.0,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/last-moove.png',
                                                        height: width * 0.064,
                                                        width: width * 0.064,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: width *
                                                                      0.031)),
                                                      Container(
                                                        width: width * 0.3462,
                                                        height: width * 0.0564,
                                                        child: AutoSizeText(
                                                          "Ваши действия",
                                                          style: TextStyle(
                                                              fontSize: 100,
                                                              fontFamily:
                                                                  "assets/fonts/Inter-Regular.ttf",
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              //------------------------------------------//ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ВАШИ ДЕЙСТВИЯ\\\\////КОНЕЦ\\---------------------------------------------\\

//------------------------------------------------/////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///QR-КОД\\\\////НАЧАЛО\\------------------------------------------\\

                                              Container(
                                                height: width * 0.146,
                                                width: width * 0.7077,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    0))),
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                    foregroundColor:
                                                        Colors.black54,
                                                    shadowColor: Colors.white,
                                                    elevation: 0.0,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/qr-code.png',
                                                        height: width * 0.064,
                                                        width: width * 0.064,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: width *
                                                                      0.031)),
                                                      Container(
                                                        width: width * 0.2462,
                                                        height: width * 0.0564,
                                                        child: AutoSizeText(
                                                          "QR-код",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "assets/fonts/Inter-Regular.ttf",
                                                              fontSize: 100,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

//------------------------------------------------------------/////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///QR-КОД\\\\////КОНЕЦ\\--------------------------------------------------\\

//-----------------------------------------------------------////////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ИЗБРАННОЕ\\\\////НАЧАЛО\\---------------------------------------------\\

                                              Container(
                                                height: width * 0.146,
                                                width: width * 0.7077,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    0))),
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                    foregroundColor:
                                                        Colors.black54,
                                                    shadowColor: Colors.white,
                                                    elevation: 0.0,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/favorite.png',
                                                        height: width * 0.064,
                                                        width: width * 0.064,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: width *
                                                                      0.031)),
                                                      Container(
                                                        width: width * 0.2462,
                                                        height: width * 0.0564,
                                                        child: AutoSizeText(
                                                          "Избранное",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "assets/fonts/Inter-Regular.ttf",
                                                              fontSize: 100,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              //----------------------------------------------------/////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ИЗБРАННОЕ\\\\////КОНЕЦ\\----------------------------------------------\\

                                              //---------------------------------------------////////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НЕВИДИМКА\\\\////НАЧАЛО\\------------------------------------\\

                                              Container(
                                                height: width * 0.146,
                                                width: width * 0.7077,
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    var prefs = await SharedPreferences.getInstance();
                                                    await prefs.remove('user_id');
                                                    Navigator.pushNamed(context, '/auth');
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Colors
                                                                .white),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20))),
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                    foregroundColor:
                                                        Colors.black54,
                                                    shadowColor: Colors.white,
                                                    elevation: 0.0,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/exit.png',
                                                        height: width * 0.064,
                                                        width: width * 0.064,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: width *
                                                                      0.031)),
                                                      Container(
                                                        width: width * 0.2462,
                                                        height: width * 0.0564,
                                                        child: AutoSizeText(
                                                          "Выход",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "assets/fonts/Inter-Regular.ttf",
                                                              fontSize: 100,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              //--------------------------------------------/////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НЕВИДИМКА\\\\////КОНЕЦ\\\------------------------------------------------\

                                              //-----------------------------------------------------//////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КОНЕЦ\\\------------------------------------------------\
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              icon: const Icon(Icons.menu),
                              iconSize: width * 0.153,
                              color: Color(0xFFffffff),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  SlidingUpPanel(
                      maxHeight: height * 0.6557,
                      minHeight: height * 0.5557,
                      borderRadius:
                          BorderRadius.vertical(top: (Radius.circular(32))),
                      panel: SafeArea(
                        child: Container(
                          width: width,
                          height: height * 0.6557,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: (Radius.circular(32))),
                              border: Border.all(
                                width: 1,
                                color: Color(0x707C7C7C),
                              )),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  //----------------------------/ИМЯ ФАМИЛИЯ\\\///НАЧАЛО\----------------------------\

                                  Container(
                                    width: width * 0.756,
                                    height: height * 0.0995,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.074, height * 0.031, 0, 0),
                                    child: AutoSizeText(
                                      textfield[0] +
                                          "\n" +
                                          textfield[
                                              1], //------------------------берет данные из массива------------\\
                                      style: TextStyle(
                                        color: Color(0xff4D4D4D),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            "assets/fonts/Inter-Bold.ttf",
                                      ),
                                    ),
                                  ),

                                  //----------------------------/ИМЯ ФАМИЛИЯ\\\///КОНЕЦ\\----------------------------\

                                  //----------------------------/КНОПКА РЕДАКТИРОВАНИЯ\\\///НАЧАЛО\----------------------------\\

                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Color(0x954D4D4D),
                                      size: width * 0.063,
                                    ),
                                  ),

                                  //----------------------------/КНОПКА РЕДАКТИРОВАНИЯ\\\///КОНЕЦ\----------------------------\\
                                ],
                              ),

                              //----------------------------/Возраст&Город\\\///НАЧАЛО\----------------------------\\
                              Row(
                                children: [
                                  Container(
                                    width: width * 0.17,
                                    height: height * 0.024,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.074, height * 0.017, 0, 0),
                                    child: AutoSizeText(
                                      'Возраст',
                                      style: TextStyle(
                                        color: Color(0x50000000),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            "assets/fonts/Inter-Medium.ttf",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.17,
                                    height: height * 0.024,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.259, height * 0.017, 0, 0),
                                    child: AutoSizeText(
                                      'Город',
                                      style: TextStyle(
                                        color: Color(0x50000000),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            "assets/fonts/Inter-Medium.ttf",
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //----------------------------/Возраст&Город\\\///КОНЕЦ\----------------------------\\

                              //----------------------------/Возраст&Город\\\///ПОЛЬЗОВАТЕЛЬ\\\///НАЧАЛО\----------------------------\\

                              Row(
                                children: [
                                  Container(
                                    width: width * 0.162,
                                    height: height * 0.0294,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.074, height * 0.0086, 0, 0),
                                    child: AutoSizeText(
                                      textfield[
                                          2], //------------------------берет данные из массива------------\\
                                      style: TextStyle(
                                        color: Color(0xff4D4D4D),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            "assets/fonts/Inter-Bold.ttf",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.423,
                                    height: height * 0.0294,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.2641, height * 0.0086, 0, 0),
                                    child: AutoSizeText(
                                      textfield[3],
                                      style: TextStyle(
                                        color: Color(0xff4D4D4D),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            "assets/fonts/Inter-Bold.ttf",
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //----------------------------/Возраст&Город\\\///ПОЛЬЗОВАТЕЛЬ\\\///КОНЕЦ\----------------------------\\

                              Row(
                                children: [
                                  Container(
                                    width: width * 0.21,
                                    height: height * 0.0233,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.074, height * 0.0282, 0, 0),
                                    child: AutoSizeText(
                                      'Контакты',
                                      style: TextStyle(
                                        color: Color(0x50000000),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            "assets/fonts/Inter-Medium.ttf",
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                    width: width * 0.485,
                                    height: height * 0.0294,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.074, height * 0.0086, 0, 0),
                                    child: AutoSizeText(
                                      textfield[
                                          4], //------------------------берет данные из массива------------\\
                                      style: TextStyle(
                                        color: Color(0x80000000),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            "assets/fonts/Inter-Medium.ttf",
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                    width: width * 0.851,
                                    height: height * 0.0294,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.074, height * 0.0086, 0, 0),
                                    child: AutoSizeText(
                                      textfield[
                                          5], //------------------------берет данные из массива------------\\
                                      style: TextStyle(
                                        color: Color(0x80000000),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            "assets/fonts/Inter-Medium.ttf",
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                    width: width * 0.21,
                                    height: height * 0.0233,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.074, height * 0.0282, 0, 0),
                                    child: AutoSizeText(
                                      'Описание',
                                      style: TextStyle(
                                        color: Color(0x50000000),
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            "assets/fonts/Inter-Medium.ttf",
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                    width: width * 0.848,
                                    height: height * 0.1884,
                                    margin: EdgeInsets.fromLTRB(
                                        width * 0.074, height * 0.0172, 0, 0),
                                    child: Flexible(
                                      child: Text(
                                        "Test", //------------------------берет данные из массива------------\\
                                        maxLines: 10,
                                        style: TextStyle(
                                          color: Color(0x90000000),
                                          fontSize: fontSizeOP,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              "assets/fonts/Inter-Medium.ttf",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
