// import 'package:auto_size_text/auto_size_text.dart';

// import 'dart:ui';

// import 'package:flutter/material.dart';
// // import 'package:vkurse_app/pages/auth_get_verification_code.dart';
// import '../generated/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../custom_package/src/utils/phone_number.dart';
// import '../custom_package/src/utils/selector_config.dart';
// import '../custom_package/src/widgets/input_widget.dart';

// // Класс для отображения страницы перехода к боту

// class Test extends StatefulWidget {

//   const Test({Key? key}) : super(key: key);
  
//   @override
//   State<Test> createState() => _Test();

// }

// class _Test extends State<Test> {

//   bool isButtonActive = false;
//   // late TextEditingController controller;
//   // late String field_phone_number;

//   // late int _PhoneNumberLength = 10;

//   // String initialCountry = 'RU';
//   // PhoneNumber number = PhoneNumber(isoCode: 'RU');

//   // @override
//   // void initState() {
//   //   super.initState();

//   //   controller = TextEditingController();
//   //   controller.addListener(() {
      
//   //   });
//   // }


//   @override
//   Widget build(BuildContext context) {

//     final mediaQuery = MediaQuery.of(context);
//     var width = mediaQuery.size.width;
//     var height = mediaQuery.sh;

//     var maskFormatter = new MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       body: Column(
//           children: [

//              ///\\\ (НАЧАЛО) ///\\\ ИКОНКА "НАЗАД" + ЛОГО ///\\\

//             Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: width,
//                 height: height * 0.3,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Positioned(
//                       child: SizedBox(
//                         width: width,
//                         height: height * 0.3,
//                         child: CustomPaint(
//                           foregroundPainter: ShapePainter(),
//                         ),
//                       ),
//                     ),

//                     Positioned(
//                       left: width * 0.025,
//                       child: SizedBox(
//                         width: width * 0.2,
//                         height: width * 0.2,
//                         child: IconButton(
//                           onPressed: () async {
//                             await Navigator.pushNamed(context, '/auth');
//                           }, 
//                           icon: const Icon(Icons.arrow_back_ios_new),
//                           iconSize: width * 0.1,
//                           color: Color(0xF0DADADA),
//                         )
//                       )
//                     ),

//                     Positioned(
//                       // left: width * 0.325,
//                       child: Container(
//                         height: width * 0.4,
//                         width: width * 0.4,
//                         decoration: BoxDecoration(
//                           image: const DecorationImage(
//                             image: AssetImage("assets/images/logo_pic.png"),
//                           opacity: 0.4,
//                           )
//                         ),
//                       )
//                     )
//                   ],

//                 ),
//               ),
//             ]
//           ),

//              //!\\\ (КОНЕЦ) ///\\\ ИКОНКА "НАЗАД" + ЛОГО ///\\\
            
//             //---------------------------------------------------------------------------------------------------------------------------------------\\

//             ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

//             SizedBox(
//               width: width * 0.05,
//               height: width * 0.05,
//             ),

//             //!\\\ (КОНЕЦ) ///\\\ ЛОГО ///\\\
            
//             //---------------------------------------------------------------------------------------------------------------------------------------\\

//             ///\\\ (НАЧАЛО) ///\\\ ПОЛЕ ДЛЯ ВВОДА НОМЕРА + ТЕКСТ ///\\\

//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         child: AutoSizeText(
//                           "Bведите номер\nтелефона",
//                           style: TextStyle(
//                             color: Color(0xF0894EB8),
//                             fontSize: 30, 
//                             fontFamily: "Comfortaa",
//                             ),
//                           maxLines: 2,
//                           textAlign: TextAlign.left,
//                         ),),

//                       Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, width * 0.1)),
                      
//                       ////////// ПОЛЕ ВВОДА НОМЕРА ТЕЛЕФОНА ////////// 
//                       Container(

//                         width: width * 0.75,
//                         height: (width * 0.7) * 0.23,

//                         child: Container(
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.symmetric(horizontal: 15),

//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(width * 0.0488),
//                             border: Border.all(
//                               color: Color(0xF0894EB8),
//                               width: 2
//                             ),
                            

//                             boxShadow: [
//                               BoxShadow(
//                                 color: Color(0xffeeeeee),
//                                 blurRadius: 10,
//                                 offset: Offset(0, 4),
//                               ),
//                             ],
//                           ),

                          
//                           child: Stack(
//                             children: [
//                               InternationalPhoneNumberInput(
//                                 textAlign: TextAlign.start,
//                                 textAlignVertical: TextAlignVertical.center,
//                                 textStyle: TextStyle(
//                                   fontSize: 18,
//                                   fontFamily: "Comfortaa"
//                                 ),

//                                 onInputChanged: (PhoneNumber number) {
//                                   // print(number.phoneNumber);
//                                   // field_phone_number = "${number.phoneNumber}";
//                                 },
                                
//                                 onInputValidated: (bool value) {
//                                     print(value);
//                                 },

//                                 selectorConfig: SelectorConfig(
//                                   selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//                                 ),

//                                 locale: "ru",
//                                 countries: ["RU", "UA", "KZ", "BY"],
//                                 // initialValue: number,
//                                 ignoreBlank: false,
//                                 autoValidateMode: AutovalidateMode.disabled,
//                                 selectorTextStyle: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontFamily: "Comfortaa"
//                                 ),
//                                 // textFieldController: controller,
//                                 formatInput: false,
//                                 // maxLength: _PhoneNumberLength,
//                                 keyboardType:TextInputType.numberWithOptions(signed: true, decimal: true),
//                                 cursorColor: Colors.black,

//                                 inputDecoration: InputDecoration(                                
//                                   // contentPadding: EdgeInsets.only(bottom: 15, left: 0),
//                                   border: InputBorder.none,
//                                   hintText: '(999) 999-99-99',
//                                   hintStyle: TextStyle(
//                                     color: Colors.grey.shade500, 
//                                     fontFamily: "Comfortaa",
//                                     fontSize: 18
//                                   ),
//                                 ),

//                                 // onSaved: (PhoneNumber number) {
//                                 //   print('On Saved: $number');
//                                 // },
//                               ),

//                               Positioned(
//                                 left: width * 0.219,
//                                 top: width * 0.0195,
//                                 bottom: width * 0.0195,
//                                 child: Container(
//                                   height: width * 0.0973,
//                                   width: width * 0.0024,
//                                   color: Colors.black.withOpacity(0.13),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),

//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: 288,
//                         height: 55,
                        
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color.fromARGB(70, 0, 0, 0),
//                               blurRadius: 25,
//                               offset: Offset(0.0, 10.0)),
//                           ],
//                         ),

//                         child: Opacity(
//                           opacity: 0.9,
//                           child: ElevatedButton(
//                           onPressed:() {

//                             // В переменной > field_phone_number < хранится то, что ввел пользователь

//                             // var prefs = await SharedPreferences.getInstance();
//                             // prefs.setString('phone_number', field_phone_number);

//                             // await Navigator.pushNamed(context, '/auth_get_verification_code');
//                           }, 
//                             style: ButtonStyle(
//                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(width * 0.039),
//                                 ),
//                               ),
//                             backgroundColor: MaterialStateProperty.all<Color>(Color(0xF0894EB8))
//                             ),

//                             child:
//                             AutoSizeText(
//                                 'Продолжить',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "Comfortaa",
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: width * 0.25,
//                       )
//                     ],
//                   )
//                 ],
//               )
//             ),
//           ]
//         )
//     );
//   }
// }

// class ShapePainter extends CustomPainter{
  
//   @override
//   void paint(Canvas canvas, Size size) {

//   Paint paint0 = Paint()
//       ..color = Color(0xF0894EB8)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;
     
         
//     Path path0 = Path();
//     path0.moveTo(0,0);
//     path0.lineTo(size.width,0);
//     path0.lineTo(size.width,size.height*0.80);
//     path0.quadraticBezierTo(size.width*0.8434750,size.height*1.0186800,size.width*0.50,size.height);
//     path0.quadraticBezierTo(size.width*0.1569500,size.height*1.0205600,0,size.height*0.8000000);
//     path0.close();

//     canvas.drawPath(path0, paint0);
  
    
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
  
// }

import 'dart:ui';
import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cron/cron.dart';
// import 'package:dgis_flutter/dgis_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:vkurse_app/data/api_location.dart';
// import 'package:vkurse_app/pages/app_location.dart';
// import 'package:vkurse_app/pages/assets_const.dart';


void locationHandler () {
  final cron = Cron();
  cron.schedule(Schedule.parse('*/5 * * * * *'), () async {
    await Geolocator.getCurrentPosition().then((value) {
      LocationApi.user_location_save("2", "${value.latitude}", "${value.longitude}");
    });
  });
}


class Test extends StatefulWidget {

  @override
  _Test createState() => _Test();

}

class _Test extends State<Test> {
  final mapController = MapController();

  List<Marker> markers = [];

  List userInfo = [["Kratos0506", "assets/images/nikitaLogo.jpg", 47.237339, 39.712246], ["Semyown", "assets/images/semenLogo.jpg", 47.239339, 39.712246], ["olardaniil", null, 47.637339, 39.715246], ["THKssssssssssss", null, 47.639339, 39.715246]];

  void createMarker(_user_id, _photo, _latitude, _longitude) {
    for(var info in userInfo){
      if(info[1] != null){
        var mark = Marker(
          width: 90.0,
          height: 90.0,
          point: latLng.LatLng(info[2], info[3]),
          builder: (ctx) => IconButton(
            onPressed: (){},
            icon: Container(
              child: Stack(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: SizedBox(
                          width: 90,
                          height: 90,
                          child: CustomPaint(
                            foregroundPainter: IconPainter(),
                          ),
                        ),
                      ),
                      Positioned(
                        // top: 8,
                        // left: width * 0.325,
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: AssetImage(info[1]),
                            // opacity: 0.4,
                            )
                          )
                        )
                      )
                    ],
                  ),
                ],
              ),
            )
          )
        );  
        setState(() {
          markers.add(mark);
        });
          
        } else {
          var mark = Marker(
            width: 90.0,
            height: 90.0,
            point: latLng.LatLng(info[2], info[3]),
            builder: (ctx) => IconButton(
              onPressed: (){},
              icon: Container(
                child: Stack(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          child: SizedBox(
                            width: 90,
                            height: 90,
                            child: CustomPaint(
                              foregroundPainter: IconPainter(),
                            ),
                          ),
                        ),
                        Positioned(
                        // top: 8,
                        // left: width * 0.325,
                          child: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              info[0],
                              maxLines: 1,
                              minFontSize: 10,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: "Comfortaa",
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  ],
                ),
              )
            )
          );
          setState(() {
            markers.add(mark);
          });
        }
      }
  }

  @override
  void initState() {
    createMarker(userInfo[0][0], userInfo[0][1], userInfo[0][2], userInfo[0][3]);
    // placeMarker(context);
    // locationHandler();
    // _initPermission();
  }

  // void placeMarker(_context) {
  
  //   final cron = Cron();
  //   cron.schedule(Schedule.parse('*/5 * * * * *'), () async {

  //   // var userLocation = [{"type": "user_location", "user_id": "2", "latitude": 47.289020, "longitude": 39.702150}, {"type": "user_location", "user_id": "3", "latitude": 47.289020, "longitude": 39.701150} ];
  //     var userLocation = await LocationApi.users_location_stream("2");
  //     var data_item = null;

  //     for (data_item in userLocation) {
  //       if (data_item["type"] == "user_location" || data_item["type"] == "friend_location") {
  //         createMarker(data_item["user_id"], data_item["latitude"], data_item["longitude"], _context);
  //       }
  //     }

  //     final status = controller.updateMarkers(mapObject as List<GisMapMarker>);
  //     mapObject.clear();
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return Scaffold(
      body: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: latLng.LatLng(47.237319946, 39.712245941),
                zoom: 13.0,
                maxZoom: 18.0,
                minZoom: 3.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/olardaniil/clf5o14q2000s01mrhe1byyg8/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoib2xhcmRhbmlpbCIsImEiOiJjbGZpbW9nM2MxczdtM3RuejV5OGxkeHMxIn0.vj2t-Rt79XjS6N225mhoRw',
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1Ijoib2xhcmRhbmlpbCIsImEiOiJjbGZpbW9nM2MxczdtM3RuejV5OGxkeHMxIn0.vj2t-Rt79XjS6N225mhoRw',
                    'id': 'mapbox.mapbox-streets-v8',
                  },
                ),
                MarkerClusterLayerWidget(
                  options: MarkerClusterLayerOptions(
                    maxClusterRadius: 40,
                    disableClusteringAtZoom: 10,
                    size: Size(50, 50),
                    // anchor: AnchorPos.align(AnchorAlign.center),
                    rotate: true,
                    rotateAlignment: Alignment.center,
                    markers: markers,
                    builder: (context, markers) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                            color: Color(0xFF894EB8)
                        ),
                        child: Center(
                          child: Text(
                            markers.length.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: width,
                                child: Image.asset("assets/images/logo_up_map.png")
                              )
                            ],
                          )
                        )
                      ],
                    ), 
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: width,
                              height: width * 0.3659, //150
                              child: Stack(
                                // ignore: sort_child_properties_last
                                children: [
                                  Positioned(
                                    bottom: 0.0,
                                    child: Container(
                                      width: width,
                                      child: Image.asset("assets/images/logo_down_map.png")
                                    ),
                                  ),

                                  Positioned(
                                    bottom: width * 0.0488, //20.0
                                    left: width * 0.0732, //30.0
                                    child: Container(
                                      width: width * 0.1703, //70
                                      height: width * 0.1703, //70
                                      child: ElevatedButton(
                                        onPressed: () {
                                          createMarker(userInfo[0], userInfo[1], userInfo[2], userInfo[3]);
                                        }, 
                                        child: Image.asset("assets/icons/user_icon.png"),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(width * 0.0488),
                                            ),
                                          ),
                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4A1A78)),
                                        )
                                      )
                                    ),
                                  ),

                                  Positioned(
                                    bottom: width * 0.0976, //40.0
                                    left: width * 0.3659, //150.0
                                    child: Container(
                                      width: width * 0.2683, //110
                                      height: width * 0.2683, //110
                                      child: ElevatedButton(
                                        onPressed: (){}, 
                                        child: Image.asset("assets/icons/event_icon.png"),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(width * 0.0585),
                                            ),
                                          ),
                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4A1A78)),
                                        )
                                      )
                                    ),
                                  ),

                                  Positioned(
                                    bottom: width * 0.0488, //20.0
                                    right: width * 0.0732, //30.0
                                    child: Container(
                                      width: width * 0.1703, //70
                                      height: width * 0.1703, //70
                                      child: ElevatedButton(
                                        onPressed: (){}, 
                                        child: Image.asset("assets/icons/chat_icon.png"),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(width * 0.0488),
                                            ),
                                          ),
                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4A1A78)),
                                        )
                                      )
                                    ),
                                  ),
                                ],
                                clipBehavior: Clip.none,
                              ),
                            )
                          ],
                        )
                      ],
                    ), 
                  ),
                ],
              )
            )
          ],
        )
    );
  }
}

class IconPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {

    final sw = size.width;
    final sh = size.height;

    Paint paint0 = Paint()
      ..color = Color(0xFF894EB8)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(sw * 0.3, sh * 0.8);
    path0.lineTo(sw * 0.7, sh * 0.8);
    path0.quadraticBezierTo(sw * 0.5409, sh * 0.9994, sw * 0.5, sh);
    path0.quadraticBezierTo(sw * 0.4591, sh * 1.0007, sw * 0.3, sh * 0.8);
    path0.close();

    canvas.drawPath(path0, paint0);
  

  Paint paint1 = Paint()
      ..color = Color(0xFF894EB8)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path1 = Path();
    path1.moveTo(sw * 0.1, sh * 0.3);
    path1.quadraticBezierTo(sw * 0.1013, sh * 0.1013, sw * 0.3, sh * 0.1);

    path1.lineTo(sw * 0.7,sh * 0.1);
    path1.quadraticBezierTo(sw * 0.9001, sh * 0.1012,sw * 0.9, sh * 0.3);
    path1.cubicTo(sw * 0.9, sh * 0.2125, sw * 0.9, sh * 0.7875, sw * 0.9, sh * 0.7);
    path1.quadraticBezierTo(sw * 0.9, sh * 0.9, sw * 0.7, sh * 0.9);

    path1.lineTo(sw * 0.3, sh * 0.9);
    path1.quadraticBezierTo(sw * 0.1010, sh * 0.9, sw * 0.1, sh * 0.7);
    path1.cubicTo(sw * 0.1, sh * 0.7875, sw * 0.1, sh * 0.2375, sw * 0.1, sh * 0.3);

    path1.close();

    canvas.drawPath(path1, paint1);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}


// class _Map extends State<Map> {
//   final GisMapController controller = GisMapController();

//   late final Future<List<GisMapMarker>> icons;
//   List<GisMapMarker> list = [];
//   List<GisMapMarker> mapObject = [];
  
//   void createMarker(_user_id, _latitude, _longitude, _context) async {
//     var iconMarker = await getPngFromAsset(_context, AssetPath.iconsPointGrey, 120);
//     mapObject.add(GisMapMarker(icon: iconMarker, latitude: _latitude, longitude: _longitude, zIndex: 0, id: _user_id.toString()));
//     print("mapObject: $mapObject");
//   }

//   void placeMarker(_context) {
  
//     final cron = Cron();
//     cron.schedule(Schedule.parse('*/5 * * * * *'), () async {

//     // var userLocation = [{"type": "user_location", "user_id": "2", "latitude": 47.289020, "longitude": 39.702150}, {"type": "user_location", "user_id": "3", "latitude": 47.289020, "longitude": 39.701150} ];
//       var userLocation = await LocationApi.users_location_stream("2");
//       var data_item = null;

//       for (data_item in userLocation) {
//         if (data_item["type"] == "user_location" || data_item["type"] == "friend_location") {
//           createMarker(data_item["user_id"], data_item["latitude"], data_item["longitude"], _context);
//         }
//       }

//       final status = controller.updateMarkers(mapObject as List<GisMapMarker>);
//       mapObject.clear();
//     });
//   }

//   @override
//   void initState() {

//     placeMarker(context);
//     locationHandler();
//     _initPermission();

//     icons = Future.wait([getPngFromAsset(context, AssetPath.iconsPointGrey, 60)]).then(
//         (value) => [GisMapMarker(icon: value[0], latitude: 47.289020, longitude: 39.701150, zIndex: 0, id: "test")]);
//     super.initState();
//   }

//   Future<Uint8List> getPngFromAsset(
//     BuildContext context,
//     String path,
//     int width,
//   ) async {
//     ByteData data = await DefaultAssetBundle.of(context).load(path);
//     Codec codec = await instantiateImageCodec(
//       data.buffer.asUint8List(),
//       targetWidth: width,
//     );
//     FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ImageByteFormat.png))!.buffer.asUint8List();
//   }


//   @override
//   Widget build(BuildContext context) {

//     final mediaQuery = MediaQuery.of(context);
//     var width = mediaQuery.size.width;
//     var height = mediaQuery.size.height;

//     return Scaffold(
//       body: Stack(
//           // ignore: sort_child_properties_last
//           children: [
//             SizedBox(
//               width: width,
//               height: height,
//               child: FutureBuilder<List<GisMapMarker>>(
//                 future: icons,
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) return const SizedBox();
//                   list = snapshot.data!;
//                   return GisMap(
//                     directoryKey: 'runhin9102',
//                     mapKey: '9d6ae96d-d730-42f7-a6a6-2e378f46215a',
//                     // directoryKey: 'rubyqf9316',
//                     // mapKey: 'b7272230-6bc3-47e9-b24b-0eba73b12fe1',
//                     useHybridComposition: true,
//                     controller: controller,
//                     onTapMarker: (marker) {
                      
//                     },
//                     startCameraPosition: const GisCameraPosition(
//                       latitude: 47.237319946,
//                       longitude: 39.712245941,
//                       tilt: 25.0,
//                       zoom: 14.0,
//                     ),
//                   );
//                 },
//               ),
//             ),

//             Positioned(
//               top: 0.0,
//               child: Container(
//                 width: width,
//                 child: Image.asset("assets/images/logo_up_map.png")
//               ),
//             ),

//             Positioned(
//               bottom: 0.0,
//               child: Container(
//                 width: width,
//                 child: Image.asset("assets/images/logo_down_map1.png")
//               ),
//             ),

//             Positioned(
//               // bottom: width * 0.2683, //110.0
//               bottom: height * 0.3, //200.0
//               right: width * 0.0488, //30.0
//               child: Container(
//                 width: width * 0.1216, //50
//                 height: width * 0.1216, //50
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     // Position geo = await Geolocator.getCurrentPosition();
//                     // final status = await controller.setCameraPosition(latitude: geo.latitude, longitude: geo.longitude, zoom: 16);
//                     final status = await controller.setCameraPosition(
//                       latitude: 47.289020, 
//                       longitude: 39.702150,
//                       zoom: 16
//                     );
//                     log(status);
//                   }, 
//                   child: Image.asset("assets/icons/currentPosition.png"),
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(width * 0.034),
//                         side: BorderSide(
//                           color: Color(0xFF0a0a0a),
//                           width: 1,
//                         )
//                       ),
//                     ),
//                   backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(150, 255, 255, 255)),
//                   )
//                 )
//               ),
//             ),
//             Positioned(
//               bottom: width * 0.0488, //20.0
//               left: width * 0.0732, //30.0
//               child: Container(
//                 width: width * 0.1703, //70
//                 height: width * 0.1703, //70
//                 child: ElevatedButton(
//                   onPressed: (){
//                     Navigator.pushNamed(context, '/profile');
//                   }, 
//                   child: Image.asset("assets/icons/user_icon.png"),
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(width * 0.0488),
//                       ),
//                     ),
//                   backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4A1A78)),
//                   )
//                 )
//               ),
//             ),

//             Positioned(
//               bottom: width * 0.0976, //40.0
//               left: width * 0.3659, //150.0
//               child: Container(
//                 width: width * 0.2683, //110
//                 height: width * 0.2683, //110
//                 child: ElevatedButton(
//                   onPressed: (){
//                   }, 
//                   child: Image.asset("assets/icons/event_icon.png"),
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(width * 0.0585),
//                       ),
//                     ),
//                   backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4A1A78)),
//                   )
//                 )
//               ),
//             ),
            
//             Positioned(
//               bottom: width * 0.0488, //20.0
//               right: width * 0.0732, //30.0
//               child: Container(
//                 width: width * 0.1703, //70
//                 height: width * 0.1703, //70
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     LocationService();
//                     print(await LocationApi.users_location_stream("2"));
//                   }, 
//                   child: Image.asset("assets/icons/chat_icon.png"),
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(width * 0.0488),
//                       ),
//                     ),
//                   backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4A1A78)),
//                   )
//                 )
//               ),
//              ),
//             ],
//           // clipBehavior: Clip.none,
//         )
//       );
//     }

//   // / Проверка разрешений на доступ к геопозиции пользователя
//   Future<void> _initPermission() async {
//     if (!await LocationService().checkPermission()) {
//       await LocationService().requestPermission();
//     }
//     await _fetchCurrentLocation();
//   }

//   /// Получение текущей геопозиции пользователя
//   Future<void> _fetchCurrentLocation() async {
//     AppLatLong location;
//     const defLocation = MoscowLocation();
//     try {
//       location = await LocationService().getCurrentLocation();
//     } catch (_) {
//       location = defLocation;
//     }
//     _moveToCurrentLocation(location);
//   }

//   /// Метод для показа текущей позиции
//   Future<void> _moveToCurrentLocation(
//     AppLatLong appLatLong,
//   ) async {
//     (await controller.setCameraPosition(
//       latitude: appLatLong.lat,
//       longitude: appLatLong.long,
//       zoom: 10,
//     ));
//   }
// }