import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vkurse_app/pages/app_location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final mapControllerCompleter = Completer<YandexMapController>();

  final List<MapObject> mapObjects = [];

  void createMarker (){
    final MapObjectId mapObjectId = MapObjectId('normal_icon_placemark');
    if (mapObjects.any((el) => el.mapId == mapObjectId)) {
      return;
    }

    final mapObject = PlacemarkMapObject(
      mapId: mapObjectId,
      point: Point(latitude: 47.237319946, longitude: 39.712245941),
      onTap: (PlacemarkMapObject self, Point point) => print('Tapped me at $point'),
      direction: 90,
      isDraggable: true,
      onDragStart: (_) => print('Drag start'),
      onDrag: (_, Point point) => print('Drag at point $point'),
      onDragEnd: (_) => print('Drag end'),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
        image: BitmapDescriptor.fromAssetImage('assets/images/check.png'),
        scale: 0.4
      )
      ));

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Текущее местоположение'),
      ),
      body: YandexMap(
        nightModeEnabled: true,
        onMapCreated: (controller) {
          mapControllerCompleter.complete(controller);
        },
        mapObjects: mapObjects,
      ),
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