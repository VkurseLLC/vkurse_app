import 'dart:ui';
import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cron/cron.dart';
import 'package:dgis_flutter/dgis_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:vkurse_app/data/api_location.dart';
import 'package:vkurse_app/pages/assets_const.dart';


void locationHandler () {
  final cron = Cron();
  cron.schedule(Schedule.parse('*/5 * * * * *'), () async {
    await Geolocator.getCurrentPosition().then((value) {
      LocationApi.user_location_save("2", "${value.latitude}", "${value.longitude}");
    });
  });
}


class Map extends StatefulWidget {

  @override
  _Map createState() => _Map();

}

class _Map extends State<Map> {
  final GisMapController controller = GisMapController();

  late final Future<List<GisMapMarker>> icons;
  List<GisMapMarker> list = [];
  List<GisMapMarker> mapObject = [];
  
  void createMarker(_user_id, _latitude, _longitude, _context) async {
    var iconMarker = await getPngFromAsset(_context, AssetPath.iconsPointGrey, 120);
    mapObject.add(GisMapMarker(icon: iconMarker, latitude: _latitude, longitude: _longitude, zIndex: 0, id: _user_id.toString()));
    print("mapObject: $mapObject");
  }

  void placeMarker(_context) {
  
    final cron = Cron();
    cron.schedule(Schedule.parse('*/5 * * * * *'), () async {

    // var userLocation = [{"type": "user_location", "user_id": "2", "latitude": 47.289020, "longitude": 39.702150}, {"type": "user_location", "user_id": "3", "latitude": 47.289020, "longitude": 39.701150} ];
      var userLocation = await LocationApi.users_location_stream("2");
      var data_item = null;

      for (data_item in userLocation) {
        if (data_item["type"] == "user_location" || data_item["type"] == "friend_location") {
          createMarker(data_item["user_id"], data_item["latitude"], data_item["longitude"], _context);
        }
      }

      final status = controller.updateMarkers(mapObject as List<GisMapMarker>);
      mapObject.clear();
    });
  }

  @override
  void initState() {

    placeMarker(context);
    locationHandler();

    icons = Future.wait([getPngFromAsset(context, AssetPath.iconsPointGrey, 60)]).then(
        (value) => [GisMapMarker(icon: value[0], latitude: 47.289020, longitude: 39.701150, zIndex: 0, id: "test")]);
    super.initState();
  }

  Future<Uint8List> getPngFromAsset(
    BuildContext context,
    String path,
    int width,
  ) async {
    ByteData data = await DefaultAssetBundle.of(context).load(path);
    Codec codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!.buffer.asUint8List();
  }


  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;


    return Scaffold(
      body: Stack(
          // ignore: sort_child_properties_last
          children: [
            SizedBox(
              width: width,
              height: height,
              child: FutureBuilder<List<GisMapMarker>>(
                future: icons,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const SizedBox();
                  list = snapshot.data!;
                  return
                   GisMap(
                    directoryKey: 'runhin9102',
                    mapKey: '9d6ae96d-d730-42f7-a6a6-2e378f46215a',
                    // directoryKey: 'rubyqf9316',
                    // mapKey: 'b7272230-6bc3-47e9-b24b-0eba73b12fe1',
                    useHybridComposition: true,
                    controller: controller,
                    onTapMarker: (marker) {
                      
                    },
                    startCameraPosition: const GisCameraPosition(
                      latitude: 47.237319946,
                      longitude: 39.712245941,
                      tilt: 25.0,
                      zoom: 14.0,
                    ),
                  );
                },
              ),
            ),

            Positioned(
              // top: width - width * 0.2683,
              bottom: width * 0.2683, //110.0
              // bottom: width * 0.4887, //200.0
              right: width * 0.0732, //30.0
              child: Container(
                width: width * 0.1216, //50
                height: width * 0.0973, //30
                child: ElevatedButton(
                  onPressed: () async {
                    // Position geo = await Geolocator.getCurrentPosition();
                    // final status = await controller.setCameraPosition(latitude: geo.latitude, longitude: geo.longitude, zoom: 16);
                    final status = await controller.setCameraPosition(
                      latitude: 47.289020, 
                      longitude: 39.702150,
                      zoom: 16
                    );
                    log(status);
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
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(100, 255, 255, 255)),
                  )
                )
              ),
            ),
      
            // Column(
            //   children: [
            //     Expanded(
            //       child: Row(
            //         children: [
            //           Expanded(
            //             child: Column(
            //               children: [
            //                 Container(
            //                   width: width,
            //                   child: Image.asset("assets/images/logo_up_map.png")
            //                 )
            //               ],
            //             )
            //           )
            //         ],
            //       ), 
            //     ),
        
            //     Expanded(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: [
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Container(
            //                 width: width,
            //                 // height: width * 0.5839, //240
            //                 height: width * 0.3659, //150
            //                 child: Stack(
            //                   // ignore: sort_child_properties_last
            //                   children: [

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

  // // / Проверка разрешений на доступ к геопозиции пользователя
  // Future<void> _initPermission() async {
  //   if (!await LocationService().checkPermission()) {
  //     await LocationService().requestPermission();
  //   }
  //   await _fetchCurrentLocation();
  // }

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
  //   (await controller.setCameraPosition(
  //     latitude: appLatLong.lat,
  //     longitude: appLatLong.long,
  //     zoom: 10,
  //   ));
  // }
}