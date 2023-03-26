//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:auto_size_text/auto_size_text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;

import 'package:cron/cron.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import 'package:vkurse_app/data/api_location.dart';
import 'package:vkurse_app/pages/additionally/app_location.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\


int user_id = 2;

void locationHandler (_user_id) {
  final cron = Cron();
  cron.schedule(Schedule.parse('*/5 * * * * *'), () async {
    if (await LocationService().checkPermission() == true) {
      await Geolocator.getCurrentPosition().then((value) {
        LocationApi.user_location_save(_user_id.toString(), "${value.latitude}", "${value.longitude}");
      });
    }
  });
}

class Map extends StatefulWidget {

  @override
  _Map createState() => _Map();

}

class _Map extends State<Map> {
  
  final mapController = MapController();

  // double myLatitude = 47.283020;
  // double myLongitude = 39.702150;

  List<Marker> markers = [];
  List<Marker> mapObject = [];

  // List userInfo = [["Kratos0506", "assets/images/nikitaLogo.jpg", 47.237339, 39.712246], ["Semyown", "assets/images/semenLogo.jpg", 47.239339, 39.712246], ["olardaniil", null, 47.637339, 39.715246], ["THKssssssssssss", null, 47.639339, 39.715246]];
  
  // user_id ЭТО user_name !!!
  void createMarker(_user_id, _username, _photo, _latitude, _longitude) {

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
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              _username, // user_name !!!
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
  void placeMarker(_user_id) {
    final cron = Cron();
    cron.schedule(Schedule.parse('*/5 * * * * *'), () async {
      mapObject.clear();
    // var userLocation = [{"type": "user_location", "user_id": "2", "latitude": 47.289020, "longitude": 39.702150}, {"type": "user_location", "user_id": "3", "latitude": 47.289020, "longitude": 39.701150} ];
      var userLocation = await LocationApi.users_location_stream(_user_id.toString());
      var data_item = null;

      // createMarker("2", "username", "assets/images/nikitaLogo.jpg", 47.289020, 39.702150);
      for (data_item in userLocation) {
        if (data_item["type"] == "user_location" || data_item["type"] == "friend_location") {
          createMarker(data_item["user_id"], "username", "assets/images/danilLogo.jpg", data_item["latitude"], data_item["longitude"]);
        }
      }
      
      setState(() {
        markers = mapObject;
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


  @override
  void initState() {
    _initPermission();
    myCurrentLocation();
    locationHandler(user_id);
    placeMarker(user_id);
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
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Color(0xFF894EB8),
                              width: 4,
                            ),
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text(
                            markers.length.toString(),
                            style: const TextStyle(
                              color: Color(0xFF894EB8),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
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

            Positioned(
              // bottom: width * 0.2683, //110.0
              bottom: height * 0.3, //200.0
              right: width * 0.0488, //30.0
              child: Container(
                width: width * 0.1216, //50
                height: width * 0.1216, //50
                child: ElevatedButton(
                  onPressed: () {
                    myCurrentLocation();
                  }, 
                  child: Image.asset("assets/icons/currentPosition.png"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.034),
                        side: BorderSide(
                          color: Color(0xFF0a0a0a),
                          width: 1,
                        )
                      ),
                    ),
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(150, 255, 255, 255)),
                  )
                )
              ),
            ),
            Positioned(
              bottom: width * 0.0488, //20.0
              left: width * 0.0732, //30.0
              child: Container(
                width: width * 0.1703, //70
                height: width * 0.1703, //70
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/profile');
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
                    LocationService();
                    print(await LocationApi.users_location_stream("2"));
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