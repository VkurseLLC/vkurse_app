//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

// Класс для отображения страницы ввода username

class NoFriendProfile extends StatefulWidget {
  const NoFriendProfile({Key? key}) : super(key: key);

  @override
  State<NoFriendProfile> createState() => _NoFriendProfile();
}
class _NoFriendProfile extends State<NoFriendProfile> {
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


  bool isDateSelected = false;

  DateTime dateTime = DateTime(DateTime.now().year - 20); // ЗДЕСЬ ХРАНИТСЯ ДАТА

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;


    final day = DateFormat('dd').format(dateTime);
    final month = DateFormat('MMMM', 'ru_RU').format(dateTime);
    final year = DateFormat('yyyy').format(dateTime);


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
                      )
                    ),
                    child: Column(
                      children: [
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
                                //
                                showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Color(0x00FFFFFF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)
                                      )
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    insetPadding: EdgeInsets.fromLTRB(
                                        width * 0.2558,
                                        height * 0.1338,
                                        width * 0.0564,
                                        height * 0.5938),
                                    content: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                          BorderRadius.circular(90),
                                        color: Color(0x00FFFFFF),
                                      ),
                                      width: width * 0.7077,
                                      height: width * 0.44,
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
                                                        color: Colors.white
                                                    ),
                                                    borderRadius:BorderRadius.only(
                                                          topLeft: Radius.circular(20),
                                                          topRight: Radius.circular(20)
                                                    )
                                                  ),
                                                  backgroundColor:Color.fromRGBO(255, 255, 255, 1),
                                                  foregroundColor:Colors.black54,
                                                  shadowColor: Colors.white,
                                                  elevation: 0.0,
                                                ),
                                              child: Row(
                                                crossAxisAlignment:CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset('assets/icons/share.png',
                                                    height: width * 0.064,
                                                    width: width * 0.064,
                                                  ),
                                                  Padding(
                                                    padding:
                                                      EdgeInsets.only(left: width * 0.031)
                                                  ),
                                                  Container(
                                                    width: width * 0.482,
                                                    height: width * 0.0564,
                                                    child: AutoSizeText(
                                                      "Поделиться",
                                                      style: TextStyle(
                                                        fontSize: 100,
                                                        fontFamily:"assets/fonts/Inter-Regular.ttf",
                                                        color:Colors.black),
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
                                                        color:Colors.white),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(0)
                                                        )
                                                ),
                                                backgroundColor:
                                                Color.fromRGBO(255, 255, 255, 1),
                                                foregroundColor:
                                                Colors.black54,
                                                shadowColor: Colors.white,
                                                elevation: 0.0,
                                                ),
                                              child: Row(
                                                crossAxisAlignment:CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset('assets/icons/worry.png',
                                                    height: width * 0.064,
                                                    width: width * 0.064,
                                                  ),

                                                  Padding(padding:EdgeInsets.only(left: width *0.031)),

                                                  Container(
                                                    width: width * 0.482,
                                                    height: width * 0.0564,
                                                    child: AutoSizeText(
                                                      "Пожаловаться",
                                                      style: TextStyle(
                                                        fontSize: 100,
                                                        fontFamily:"assets/fonts/Inter-Regular.ttf",
                                                        color:Colors.black),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                              //------------------------------------------//ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ВАШИ ДЕЙСТВИЯ\\\\////КОНЕЦ\\---------------------------------------------\\

                                              //----------------------------------------------------/////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ИЗБРАННОЕ\\\\////КОНЕЦ\\----------------------------------------------\\

                                              //---------------------------------------------////////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НЕВИДИМКА\\\\////НАЧАЛО\\------------------------------------\\

                                          Container(
                                            height: width * 0.146,
                                            width: width * 0.7077,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style:
                                                ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(color: Colors.white),
                                                      borderRadius:BorderRadius.only(
                                                        bottomLeft: Radius.circular(20),
                                                        bottomRight: Radius.circular(20)
                                                      )
                                                  ),
                                                  backgroundColor:Color.fromRGBO(255, 255, 255, 1),
                                                  foregroundColor:
                                                  Colors.black54,
                                                  shadowColor: Colors.white,
                                                  elevation: 0.0,
                                                ),
                                              child: Row(
                                                crossAxisAlignment:CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset('assets/icons/block.png',
                                                    height: width * 0.064,
                                                    width: width * 0.064,
                                                  ),

                                                  Padding(padding:EdgeInsets.only(left: width *0.031)),

                                                  Container(
                                                    width: width * 0.482,
                                                    height: width * 0.0564,
                                                    child: AutoSizeText("Заблокировать",
                                                      style: TextStyle(
                                                        fontFamily:"assets/fonts/Inter-Regular.ttf",
                                                        fontSize: 100,
                                                        color: Color(0xffFF7A7A)
                                                      ),
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
                                }
                              );
                            },
                          icon: const Icon(Icons.menu),
                          iconSize: width * 0.153,
                          color: Color(0xFFffffff),
                        )
                      ],
                    ),
                  )
                ]
              ),
                  ),

                  SlidingUpPanel(
                      maxHeight: height * 0.6557,
                      minHeight: height * 0.5557,
                      borderRadius:
                          BorderRadius.vertical(
                            top: (Radius.circular(32)
                            )
                          ),
                      panel: SafeArea(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: height * 0.6557,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(1),
                                borderRadius: BorderRadius.vertical(
                                  top: (Radius.circular(32)
                                  )
                                )
                              ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(top: width * 0.079),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width * 0.88,
                                      height: width * 0.108,
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            textfield[0],
                                            style: TextStyle(
                                              fontSize: 100,
                                              color: Color(0xff4D4D4D),
                                              fontWeight: FontWeight.bold,
                                              fontFamily:"assets/fonts/Inter-Bold.ttf",
                                            ),
                                          ),
                                        ]
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width * 0.88,
                                      height: width * 0.108,
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            textfield[1],
                                            style: TextStyle(
                                              fontSize: 100,
                                              color: Color(0xff4D4D4D),
                                              fontWeight: FontWeight.bold,
                                              fontFamily:"assets/fonts/Inter-Bold.ttf",
                                            ),
                                          ),
                                        ]
                                      ),
                                    ),
                                  ],
                                ),

                                Padding(
                                    padding:EdgeInsets.only(top: height * 0.112)
                                ),

                                Container(
                                  width: width * 0.653,
                                  height: width * 0.133,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(width * 0.039),
                                        ),
                                      ),
                                      backgroundColor:
                                        MaterialStateProperty.all<Color>(Color(0xFF9A68C2))
                                    ),

                                    child: Container(
                                      width: width * 0.65,
                                      height: width * 0.0564,
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            'Добавить в друзья',
                                            style: TextStyle(
                                            fontSize: 50,
                                            fontFamily: "Comfortaa",
                                            fontWeight:
                                              FontWeight.bold),
                                          )
                                        ]
                                      )
                                    )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    )
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
