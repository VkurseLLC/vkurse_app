import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

import 'package:vkurse_app/pages/app_location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {

  @override
  _Map createState() => _Map();

}

class _Map extends State<Map> {

  final mapControllerCompleter = Completer<YandexMapController>();

  final List<MapObject> mapObjects = [];

  Future<List> getCurrentLocation() async {
    List listGeo = [];
    await Geolocator.getCurrentPosition().then((value) {
      setState(() {
        listGeo = [value.latitude, value.longitude];
      });
    });
    return listGeo;
  }

  void createMarker () async {
    final MapObjectId mapObjectId = MapObjectId('normal_icon_placemark');

    var list = await getCurrentLocation();

    final mapObject = PlacemarkMapObject(
      mapId: mapObjectId,
      point: Point(latitude: list[0], longitude: list[1]),
      onTap: (PlacemarkMapObject self, Point point) => print(mapObjectId),
      opacity: 1,
    );
    
    setState(() {
      mapObjects.add(mapObject);
    });
  }

  @override
  void initState() {
    super.initState();
    createMarker();
    _initPermission().ignore();
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;

    return Scaffold(
      body: Stack(
          children: [
            YandexMap(
            nightModeEnabled: true,
            onMapCreated: (controller) {
              mapControllerCompleter.complete(controller);
            },
            mapObjects: mapObjects,
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
            // )
          ],
        )
    );
  }

  /// Проверка разрешений на доступ к геопозиции пользователя
  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  /// Получение текущей геопозиции пользователя
  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }

  /// Метод для показа текущей позиции
  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 12,
        ),
      ),
    );
  }
}