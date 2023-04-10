// //?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:shared_preferences/shared_preferences.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:image_picker/image_picker.dart';
import 'package:vkurse_app/pages/style/canvas.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

class CircleMenu extends StatefulWidget {
  const CircleMenu({Key? key}) : super(key: key);

  @override
  State<CircleMenu> createState() => _CircleMenu();
}

bool visable1 = true;
bool visable2 = false;

class _CircleMenu extends State<CircleMenu> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0x00ffffff),
      body: Container(
        height: height,
        width: width,
        color: Color.fromARGB(90, 185, 180, 180),
        child: Stack(
          children: <Widget>[
            Visibility(
              visible: visable1,
              child: Positioned(
                top: height * 0.723,
                right: 0.852,
                child: Container(
                  width: width * 0.148,
                  height: width * 0.125,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(width * 0.064),
                    color: Color(0xff63358F)
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        visable1 = false;
                        visable2 = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff63358F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(width * 0.064),
                          bottomLeft:Radius.circular(width * 0.064)
                        )
                      ),
                          padding: EdgeInsets.all(0)),
                    child: Row(
                      children: [
                        Padding(padding:EdgeInsets.only(left: width * 0.028)
                        ),
                        Container(
                          width: width * 0.075,
                          height: width * 0.075,
                          child: Image.asset(
                            'assets/icons/logo_menu.png',
                          ),
                        ),
                      ],
                    )
                  )
                ),
              )
            ),
            Visibility(
              visible: visable2,
              child: Positioned(
                top: height * 0.61,
                left: width * 0.751,
                child:
                  Stack(
                    children:<Widget> [
                      Container(
                        width: width * 0.249,
                        height: width * 0.602,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(width * 0.5),
                            bottomLeft: Radius.circular(width * 0.5)),
                          color: Color(0x70535353)),
                        child: Row(
                          children: [
                            Padding(padding:EdgeInsets.only(left: width * 0.045)),
                            Column(
                              children: [
                                Padding(padding:EdgeInsets.only(top: width * 0.198)
                                ),
                                SizedBox(
                                  width: width * 0.077,
                                  height: width * 0.077,
                                  child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/icons/qr-code_white.png",
                                      width: width * 0.075,
                                      height: width * 0.075,
                                    )
                                  ),
                                ),

                                Padding(padding:EdgeInsets.only(top: width * 0.052)
                                ),

                                SizedBox(
                                  width: width * 0.077,
                                  height: width * 0.077,
                                  child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/icons/add-user.png",
                                      width: width * 0.077,
                                      height: width * 0.077,
                                      color: Colors.white,
                                    )
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: width * 0.02)),
                            Column(
                              children: [

                                Padding(padding:EdgeInsets.only(top: width * 0.092)
                                ),

                            SizedBox(
                              width: width * 0.077,
                              height: width * 0.077,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/icons/user (1).png",
                                  width: width * 0.077,
                                  height: width * 0.077,
                                )
                              ),
                            ),

                            Padding(padding:EdgeInsets.only(top: width * 0.254)
                          ),

                          SizedBox(
                            width: width * 0.077,
                            height: width * 0.077,
                            child: IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/icons/settings_white.png",
                                width: width * 0.077,
                                height: width * 0.077,
                              )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: width*0.263,
                  left: width*0.16,
                  child:SizedBox(
                    width: width * 0.054,
                    height: width * 0.054,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          visable1 = true;
                          visable2 = false;
                        });
                      },
                      icon: Icon(Icons.close, size: width*0.09,),
                      color: Colors.white,
                    ),
                  ),
                ),                
              ],
            ) 
          )
        )                   
      ],
    )
  )
);
  

}
}