import 'dart:async';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:vkurse_app/data/api_location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:vkurse_app/pages/app_location.dart';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';
import 'package:dgis_flutter/dgis_flutter.dart';

class AssetPath {
  AssetPath._();
  static const iconsPointGrey = "assets/images/check.png";
}

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

  late Future<List<GisMapMarker>> icons;
  List<GisMapMarker> list = [];

   @override
  void initState() {
    // icons = Future.wait([getPngFromAsset(context, AssetPath.iconsPointGrey, 60)]).then(
    //     (value) => [GisMapMarker(icon: value[0], latitude: 52.29778, longitude: 104.29639, zIndex: 0, id: "123456")]);
    super.initState();
    // locationHandler();
    createMarker();
    // _initPermission();
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

  // final List<MapObject> mapObjects = [];

  void createMarker () {

    const id = "test";

    List geo = [[47.237319946, 39.712245941], [47.237339946, 39.712245941], [47.237359946, 39.712245941], [47.237379946, 39.712245941], [47.237399946, 39.712245941], [47.237419946, 39.712245941], [47.237439946, 39.712245941], [47.237459946, 39.712245941], [47.237479946, 39.712245941], [47.237499946, 39.712245941], [47.238319946, 39.712245941]];

    for(var coord in geo){
      icons = Future.wait([getPngFromAsset(context, AssetPath.iconsPointGrey, 60)]).then(
        (value) => [GisMapMarker(icon: value[0], latitude: coord[0], longitude: coord[1], zIndex: 0, id: id)]);
    }

    controller.updateMarkers(list);

  }

    // final mapObject = PlacemarkMapObject(
    //   mapId: mapObjectId,
    //   point: Point(latitude: x, longitude: y),
    //   onTap: (PlacemarkMapObject self, Point point) => print(mapObjectId),
    //   opacity: 1,
    //   icon: PlacemarkIcon.single(PlacemarkIconStyle(
    //     image: BitmapDescriptor.fromAssetImage('assets/icons/user_icon.png'),
    //     scale: 0.2
    //   ))
    // );

  // void placeMarker () async {

  //   final cron = Cron();
  //   cron.schedule(Schedule.parse('*/5 * * * * *'), () async {
  //     var userLocation = await LocationApi.users_location_stream("2");

  //     var data_item = null;

  //     for (data_item in userLocation) {
  //       if (data_item["type"] == "user_location" || data_item["type"] == "friend_location") {
  //         createMarker(data_item["user_id"], data_item["latitude"], data_item["longitude"]);
  //       }
  //     }
  //   });    
  // }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;


    return Scaffold(
      body: Stack(
          children: [
            SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<List<GisMapMarker>>(
          future: icons,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const SizedBox();
            list = snapshot.data!;
            return GisMap(
              directoryKey: 'rubyqf9316',
              mapKey: 'b7272230-6bc3-47e9-b24b-0eba73b12fe1',
              useHybridComposition: true,
              controller: controller,
              onTapMarker: (marker) {
                // ignore: avoid_print
                print("good");
              },
              startCameraPosition: const GisCameraPosition(
                latitude: 47.237319946,
                longitude: 39.712245941,
                // bearing: 85.0,
                tilt: 25.0,
                zoom: 14.0,
              ),
            );
          },
        ),
      ),

             Column(
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
                                        onPressed: () {
                                          // await controller.updateMarkers(list);
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
            // )
          ],
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