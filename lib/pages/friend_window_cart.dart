//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

// Класс для отображения страницы ввода username

// class FriendWindowCard extends StatefulWidget {
//   const FriendWindowCard({Key? key}) : super(key: key);

//   @override
//   State<FriendWindowCard> createState() => _FriendWindowCard();
// }

// class _FriendWindowCard extends State<FriendWindowCard> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     var width = mediaQuery.size.width;
//     var height = mediaQuery.size.height;

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color(0x00ffffff),
//       body: SafeArea(
//         child: Container(
//           height: height,
//           width: width,
//           color: Color.fromARGB(90, 185, 180, 180),
//           child: Column(
//             children: [
//               Container(
//                 width: 200,
//                 height: 100,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     showGeneralDialog(
//                       barrierColor: Color(0x00ffffff),
//                       barrierDismissible: true,
//                       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//                       context: context,
//                       pageBuilder: (_, __, ___) {
//                         return Column(children: [
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   top: height * 0.717)),
//                           SingleChildScrollView(
//                               child: Container(
//                                   width: width,
//                                   height: 0.283 * height,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(width * 0.05),
//                                       topRight: Radius.circular(width * 0.05)
//                                     )
//                                   ),
//                                   child: Column(children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(top: width * 0.059)
//                                     ),
//                                     Container(
//                                       width: width * 0.256,
//                                       height: width * 0.0128,
//                                       decoration: BoxDecoration(
//                                         color: Color(0xffB3B3B3),
//                                         borderRadius: BorderRadius.all(Radius.circular(width * 0.08)
//                                         )
//                                       )
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(top: width * 0.048)
//                                     ),
//                                     Row(
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.only(left: width * 0.066)
//                                         ),
//                                         Container(
//                                           width: width * 0.2,
//                                           height: width * 0.2,
//                                           decoration: BoxDecoration(
//                                             borderRadius:BorderRadius.circular(width * 0.051),
//                                           ),
//                                           child: ElevatedButton(
//                                             onPressed: () {},
//                                               style: ElevatedButton.styleFrom(
//                                                 backgroundColor:Color(0xFF6FD1E7),
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius:BorderRadius.circular(width *0.051)
//                                                 ),
//                                                 padding:
//                                                   EdgeInsets.all(0)
//                                               ),
//                                               child: Container(
//                                                 width: width * 0.2,
//                                                 height: width * 0.2,
//                                                 child: Row(
//                                                   crossAxisAlignment:CrossAxisAlignment.center,
//                                                   mainAxisAlignment:MainAxisAlignment.center,
//                                                   children: [
//                                                     ClipRRect(
//                                                       borderRadius:BorderRadius.circular(width *0.051),
//                                                       child: Image.asset(
//                                                         'assets/images/nikitaLogo.jpg',
//                                                         width:width *0.2,
//                                                         height:width *0.2,
//                                                       )
//                                                     )
//                                                   ]
//                                                 ),
//                                               )
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(left: width * 0.033)
//                                         ),
//                                         Container(
//                                           width: width * 0.628,
//                                           height: width * 0.154,
//                                           child: Column(
//                                             children: [
//                                               SizedBox(
//                                                 width: width * 0.628,
//                                                 height: width * 0.087,
//                                                 child: AutoSizeText(
//                                                   friendData[0], /*--------берет данные из листа-------------------*/
//                                                   style: TextStyle(
//                                                     fontSize: 100,
//                                                     fontFamily:"assets/fonts/Inter-Bold.ttf",
//                                                     color: Color(0xff4D4D4D),
//                                                     fontWeight:FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:EdgeInsets.only(top: width *0.006)
//                                               ),
//                                               SizedBox(
//                                                 width: width * 0.628,
//                                                 height: width * 0.061,
//                                                 child: AutoSizeText(
//                                                   friendData[1] + " " +friendData[2], /*--------берет данные из листа-------------------*/
//                                                   style: TextStyle(
//                                                     fontSize: 100,
//                                                     fontFamily:"assets/fonts/Inter-Bold.ttf",
//                                                     color: Color(0xff4D4D4D),
//                                                     fontWeight:FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(top: width * 0.059)
//                                     ),
//                                     Container(
//                                       width: width * 0.856,
//                                       height: width * 0.141,
//                                       decoration: BoxDecoration(
//                                         color: Color(0xffF0F0F0),
//                                         borderRadius:BorderRadius.all(
//                                           Radius.circular(width * 0.05)
//                                         )
//                                       ),
//                                       child: ElevatedButton(
//                                         onPressed: () {},
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor:Color(0xFF6FD1E7),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:BorderRadius.circular(width *0.051)
//                                             ),
//                                           padding:EdgeInsets.all(0)
//                                         ),
//                                         child: Container(
//                                           width:width * 0.856,
//                                           height:width * 0.141,
//                                           decoration: BoxDecoration(
//                                             color:Color(0xffF0F0F0),
//                                             borderRadius:BorderRadius.all(
//                                               Radius.circular(width *0.05)
//                                             )
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               Padding(
//                                                 padding:EdgeInsets.only(left: width *0.049)
//                                               ),
//                                               SizedBox(
//                                                 width: width * 0.407,
//                                                 height: width * 0.048,
//                                                 child: AutoSizeText(
//                                                   "Введите сообщение",
//                                                   style: TextStyle(
//                                                     fontSize: 100,
//                                                     fontFamily:"assets/fonts/Inter-Regular.ttf",
//                                                     color: Color(0xffBABABA)),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:EdgeInsets.only(left: width *0.269)
//                                               ),
//                                               SizedBox(
//                                                 width: width * 0.09,
//                                                 height: width * 0.09,
//                                                 child: Image.asset(
//                                                   "assets/icons/send-message.png",
//                                                   scale: 0.2,
//                                                   color: Color(0xffAF8FCF),
//                                                 ),
//                                               )
//                                             ]
//                                           )
//                                         ),
//                                       ),
//                                     )
//                                   ]
//                                 )
//                               )
//                             )
//                           ]
//                         );
//                       }
//                     );
//                   },
//                   child: Text('нажми'),
//                 )
//               )
//             ]
//           )
//         )
//       )
//     );
//   }
// }


void open_short_friend_cart(context, width, height, username, name, surname) {

  // List friendData = ['Kratos05060', 'Фомичев', 'Никита'];

  showGeneralDialog(
    barrierColor: Color(0x00ffffff),
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    context: context,
    pageBuilder: (_, __, ___) {
      return Column(children: [
        Padding(
            padding: EdgeInsets.only(
                top: height * 0.717)),
        SingleChildScrollView(
            child: Container(
                width: width,
                height: 0.283 * height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * 0.05),
                    topRight: Radius.circular(width * 0.05)
                  )
                ),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: width * 0.059)
                  ),
                  Container(
                    width: width * 0.256,
                    height: width * 0.0128,
                    decoration: BoxDecoration(
                      color: Color(0xffB3B3B3),
                      borderRadius: BorderRadius.all(Radius.circular(width * 0.08)
                      )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: width * 0.048)
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.066)
                      ),
                      Container(
                        width: width * 0.2,
                        height: width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(width * 0.051),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Color(0xffF0F0F0),
                              shape: RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(width *0.051)
                              ),
                              padding:
                                EdgeInsets.all(0)
                            ),
                            child: Container(
                              width: width * 0.2,
                              height: width * 0.2,
                              child: Row(
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius:BorderRadius.circular(width *0.051),
                                    child: Image.asset(
                                      'assets/icons/user_icon.png',
                                      width:width *0.15,
                                      height:width *0.15,
                                    )
                                  )
                                ]
                              ),
                            )
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.033)
                      ),
                      Container(
                        width: width * 0.628,
                        height: width * 0.154,
                        child: Column(
                          children: [
                            SizedBox(
                              width: width * 0.628,
                              height: width * 0.087,
                              child: AutoSizeText(
                                username.toString(), /*--------берет данные из листа-------------------*/
                                style: TextStyle(
                                  fontSize: 100,
                                  fontFamily:"assets/fonts/Inter-Bold.ttf",
                                  color: Color(0xff4D4D4D),
                                  fontWeight:FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.only(top: width *0.006)
                            ),
                            SizedBox(
                              width: width * 0.628,
                              height: width * 0.061,
                              child: AutoSizeText(
                                name.toString() + " " + surname.toString(), /*--------берет данные из листа-------------------*/
                                style: TextStyle(
                                  fontSize: 100,
                                  fontFamily:"assets/fonts/Inter-Bold.ttf",
                                  color: Color(0xff4D4D4D),
                                  fontWeight:FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: width * 0.059)
                  ),
                  Container(
                    width: width * 0.856,
                    height: width * 0.141,
                    decoration: BoxDecoration(
                      color: Color(0xffF0F0F0),
                      borderRadius:BorderRadius.all(
                        Radius.circular(width * 0.05)
                      )
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Color(0xFF6FD1E7),
                        shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(width *0.051)
                          ),
                        padding:EdgeInsets.all(0)
                      ),
                      child: Container(
                        width:width * 0.856,
                        height:width * 0.141,
                        decoration: BoxDecoration(
                          color:Color(0xffF0F0F0),
                          borderRadius:BorderRadius.all(
                            Radius.circular(width *0.05)
                          )
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:EdgeInsets.only(left: width *0.049)
                            ),
                            SizedBox(
                              width: width * 0.407,
                              height: width * 0.048,
                              child: AutoSizeText(
                                "Введите сообщение",
                                style: TextStyle(
                                  fontSize: 100,
                                  fontFamily:"assets/fonts/Inter-Regular.ttf",
                                  color: Color(0xffBABABA)),
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.only(left: width *0.269)
                            ),
                            SizedBox(
                              width: width * 0.09,
                              height: width * 0.09,
                              child: Image.asset(
                                "assets/icons/send-message.png",
                                scale: 0.2,
                                color: Color(0xffAF8FCF),
                              ),
                            )
                          ]
                        )
                      ),
                    ),
                  )
                ]
              )
            )
          )
        ]
      );
    }
  );
}