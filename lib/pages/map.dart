//?_________________________________________START OF IMPORTS________________________________________________?\\
//_____________________________________________SYSTEM________________________________________________\\

import 'package:flutter/material.dart';

//_____________________________________________LIBRARYIES________________________________________________\\

import 'package:auto_size_text/auto_size_text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cron/cron.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

//_____________________________________________OTHER FILES________________________________________________\\

import 'package:vkurse_app/data/api_location.dart';
import 'package:vkurse_app/pages/additionally/app_location.dart';

import 'circle_menu.dart';
import 'friend_window_cart.dart';
import 'friends.dart';
//!___________________________________________END OF IMPORTS________________________________________________!\\

void locationHandler () async {
  var prefs = await SharedPreferences.getInstance();
  var _user_id = prefs.getString('user_id');
  final cron = Cron();
  cron.schedule(Schedule.parse('*/5 * * * * *'), () async {
    if (await LocationService().checkPermission() == true) {
      await Geolocator.getCurrentPosition().then((value) {
        LocationApi.user_location_save(_user_id.toString(), "${value.latitude}", "${value.longitude}");
      });
    }
  });
}

void get_user_id() async {
  var prefs = await SharedPreferences.getInstance();
  var user_id = prefs.getString('user_id');
}

class Map extends StatefulWidget {

  @override
  _Map createState() => _Map();

}

class _Map extends State<Map> {
  
  final mapController = MapController();

  List<Marker> markers = [];
  List<Marker> mapObject = [];
  List<Widget> listFriends = [];
  List listFriendsData = [];
  bool visable1 = true;
  bool visable2 = false;
  // List download_listFriendsData = [];

  var user_id = null;

  void createMarker(_user_id, _username, _name, _surname, _photo, _latitude, _longitude) {

      if (_photo != null) {
        setState(() {
          mapObject.add(Marker(
          width: 90.0,
          height: 90.0,
          point: latLng.LatLng(_latitude , _longitude),
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
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: AssetImage(_photo),
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
        ));
        });
        
        } else {
          setState(() {
            mapObject.add(Marker(
            width: 90.0,
            height: 90.0,
            point: latLng.LatLng(_latitude, _longitude),
            builder: (ctx) => IconButton(
              onPressed: (){
                print('tap');
                final mediaQuery = MediaQuery.of(context);
                var width = mediaQuery.size.width;
                var height = mediaQuery.size.height;
                open_short_friend_cart(context, width, height, _username, _name, _surname);
              },
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
                          child: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              _username,
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
          ));
          });
        }
  }

  // Метод для размещения маркеров
  void placeMarker() async {
    var prefs = await SharedPreferences.getInstance();
    var user_id = prefs.getString('user_id');

    final cron = Cron();
    cron.schedule(Schedule.parse('*/5 * * * * *'), () async {
      mapObject.clear();
      List download_listFriendsData = [];
      var userLocation = await LocationApi.users_location_stream(user_id.toString());
      print("userLocation: $userLocation");
      var data_item = null;

      if (userLocation != null) {
        for (data_item in userLocation) {
          if (data_item["type"] == "user_location" || data_item["type"] == "friend_location") {
            createMarker(data_item["user_id"], data_item["username"], data_item["name"], data_item["surname"], null, data_item["latitude"], data_item["longitude"]);
          }
          if (data_item["type"] == "friend_location") {
              download_listFriendsData.add({"user_id": data_item["user_id"], "user_photo": null, "user_name": data_item["name"]});
              
            listFriendsData.add({"user_id": data_item["user_id"], "user_photo": null, "user_name": data_item["username"]});
          }
        }
      }
      // print("mapObject: $mapObject");

      setState(() {
        markers = mapObject;
        listFriendsData = download_listFriendsData;
      });

      new Future.delayed(Duration.zero,() {
        listFriends.clear();
        createFriendCard(context);
      });

    });
  }

  // Цинтровка экрана по местоположению пользователя
  void myCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((value) {
      setState(() {
        mapController.center.latitude = value.latitude;
        mapController.center.longitude = value.longitude;
      });
    });
  }

  void createFriendCard(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
      var width = mediaQuery.size.width;   

    for (var data_item in listFriendsData){

      var friend = Container(
          height: width * 0.244,
          width: width * 0.869,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffF7F7F7),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(width * 0.05),
              )
            ),

            onPressed: () async {
              var prefs = await SharedPreferences.getInstance();
              prefs.setString('select_user_id', data_item['user_id'].toString());

              Navigator.pushNamed(context, '/my_friend');
            },

            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: width * 0.007)),
                Container(
                  width: width * 0.192,
                  height: width * 0.192,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(90)),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.205,
                        height: width * 0.108,
                        child: Image.asset(
                          "assets/images/camera-to-take-photos.png",
                        )
                      )
                    ]
                  ),
                ),

                Padding(padding: EdgeInsets.only(left: width * 0.0615)),
                SizedBox(
                  width: width * 0.410,
                  height: width * 0.0615,
                  child: AutoSizeText(
                    data_item["user_name"].toString(),
                    style: TextStyle(fontSize: 70, color: Colors.black),
                  ),
                ),

                Padding(padding: EdgeInsets.only(left: width * 0.016)),
                SizedBox(
                  width: width * 0.086,
                  height: width * 0.086,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0x00ffffff),
                      elevation: 0.0,
                      padding: EdgeInsets.all(0.0)),
                    onPressed: () {},
                    child: Container(
                      width: width * 0.086,
                      height: width * 0.86,
                      child: Image.asset("assets/icons/chat-balloon_c_2.png",)
                    )
                  ),
                )
              ],
            ),
          ),
        );

        setState(() {
          listFriends.add(friend);
        });

      }
  }

  @override
  void initState() {
    _initPermission();
    myCurrentLocation();
    locationHandler();
    placeMarker();
    new Future.delayed(Duration.zero,() {
      createFriendCard(context);
    });
  }

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
                // center:  latLng.LatLng(myLatitude, myLongitude),
                zoom: 13.0,
                maxZoom: 18.0,
                minZoom: 3.0,
              ),

              children: [
                TileLayer(
                  // urlTemplate:
                  //   'http://tile2.maps.2gis.com/tiles?x={x}&y={y}&z={z}',
                  // subdomains: 
                  //   ['a', 'b', 'c'],

                  // urlTemplate:
                  //   'http://mapgl.2gis.com//tiles?x={x}&y={y}&z={z}',
                  // subdomains: 
                  //   ['a', 'b', 'c'],

                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/olardaniil/clf5o14q2000s01mrhe1byyg8/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoib2xhcmRhbmlpbCIsImEiOiJjbGZpbW9nM2MxczdtM3RuejV5OGxkeHMxIn0.vj2t-Rt79XjS6N225mhoRw',
                  // ignore: prefer_const_literals_to_create_immutables
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1Ijoib2xhcmRhbmlpbCIsImEiOiJjbGZpbW9nM2MxczdtM3RuejV5OGxkeHMxIn0.vj2t-Rt79XjS6N225mhoRw',
                    'id': 'mapbox.mapbox-streets-v8',
                  },
                ),
                MarkerLayer(
                  markers: markers
                ),
                
                // MarkerClusterLayerWidget(
                //   options: MarkerClusterLayerOptions(
                //     maxClusterRadius: 40,
                //     disableClusteringAtZoom: 10,
                //     size: Size(50, 50),
                //     // anchor: AnchorPos.align(AnchorAlign.center),
                //     rotate: true,
                //     rotateAlignment: Alignment.center,
                //     markers: markers,
                //     builder: (context, markers) {
                //       return Container(
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(15),
                //             border: Border.all(
                //               color: Color(0xFF894EB8),
                //               width: 4,
                //             ),
                //             color: Colors.white
                //         ),
                //         child: Center(
                //           child: Text(
                //             markers.length.toString(),
                //             style: const TextStyle(
                //               color: Color(0xFF894EB8),
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),

            Positioned(
              top: 0.0,
              child: Container(
                width: width,
                child: Image.asset("assets/images/logo_up_map.png")
              ),
            ),

            Positioned(
              bottom: 0.0,
              child: Container(
                width: width,
                child: Image.asset("assets/images/logo_down_map1.png")
              ),
            ),

            Visibility(
              visible: visable1,
              child: Positioned(
                top: height * 0.7,
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
                top: height * 0.584,
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
                                onPressed: () {
                                  Navigator.pushNamed(context, '/profile');
                                },
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
        ),  

            // CircleMenu(),

            // Positioned(
            //   bottom: height * 0.3, //200.0
            //   right: width * 0.0488, //30.0
            //   child: Container(
            //     width: width * 0.1216, //50
            //     height: width * 0.1216, //50
            //     child: ElevatedButton(
            //       onPressed: () {
            //         myCurrentLocation();
            //       }, 
            //       child: Image.asset("assets/icons/currentPosition.png"),
            //       style: ButtonStyle(
            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(width * 0.034),
            //             side: BorderSide(
            //               color: Color(0xFF0a0a0a),
            //               width: 1,
            //             )
            //           ),
            //         ),
            //       backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(150, 255, 255, 255)),
            //       )
            //     )
            //   ),
            // ),

            Positioned(
              bottom: width * 0.0488, //20.0
              left: width * 0.0732, //30.0
              child: Container(
                width: width * 0.1703, //70
                height: width * 0.1703, //70
                child: ElevatedButton(
                  onPressed: (){
                    // SEARCH
                    // Navigator.pushNamed(context, '/my_friends');
                    viewMyFriends(context, width, height, listFriends);
                  },
                  child: Image.asset("assets/icons/search.png"),
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
                  onPressed: (){
                  }, 
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
                  onPressed: () async {
                    
                  }, 
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
          // clipBehavior: Clip.none,
        )
      );
    }


  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
  }

  // /// Получение текущей геопозиции пользователя
  // Future<void> _fetchCurrentLocation() async {
  //   AppLatLong location;
  //   const defLocation = MoscowLocation();
  //   try {
  //     location = await LocationService().getCurrentLocation();
  //   } catch (_) {
  //     location = defLocation;
  //   }
  //   _moveToCurrentLocation(location);
  // }

  // /// Метод для показа текущей позиции
  // Future<void> _moveToCurrentLocation(
  //   AppLatLong appLatLong,
  // ) async {
  //   (await mapcontroller.setCameraPosition(
  //     latitude: appLatLong.lat,
  //     longitude: appLatLong.long,
  //     zoom: 10,
  //   ));
  // }
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