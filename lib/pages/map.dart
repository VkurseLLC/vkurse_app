// ignore_for_file: unnecessary_new
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  @override
  _Map createState() => _Map();
}


class _Map extends State<Map> {

  final mapController = MapController();

  List<Marker> list_markers = [];

  void create_marker(x, y) {
  list_markers.add(Marker(
      width: 45.0,
      height: 45.0,
      point: new latLng.LatLng(x, y), 
      builder: (context) => new Container(
        child: IconButton(
          icon: Icon(Icons.location_on),
          color: Colors.red,
          iconSize: 45.0,
          onPressed: () {
            print("$x $y");
            // mapPlacesToMarkers_1();
            setState(() {
              Set<Marker>.from(places_1);
            });
          },
        ),
      )
    ));
  }

  List places = [[47.247319446, 39.722245951,], [47.237319446, 39.712345951], [47.237319446, 39.722745951]];

  List places_1 = [[47.257319446, 39.722245951]];

  void mapPlacesToMarkers() async {
    for (var plasce in places) {
      create_marker(plasce[0], plasce[1]);
    }
  }

  void mapPlacesToMarkers_1() async {
    for (var plasce in places_1) {
      create_marker(plasce[0], plasce[1]);
    }
  }

  @override
  initState() {
    super.initState();
    mapPlacesToMarkers();
  }



  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;

    return Scaffold(
      body: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: latLng.LatLng(47.27319946, 39.712245941),
                zoom: 12.0,
                maxZoom: 18.0,
                minZoom: 5.0,
              ),

              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/olardaniil/clf5o14q2000s01mrhe1byyg8/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoib2xhcmRhbmlpbCIsImEiOiJjbGYyYW8zenkwMWk1M3JudG5jeW01ZHNoIn0.d5HskUsAcPfU479m_UAM0A',
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1Ijoib2xhcmRhbmlpbCIsImEiOiJjbGYyYW8zenkwMWk1M3JudG5jeW01ZHNoIn0.d5HskUsAcPfU479m_UAM0A',
                    'id': 'mapbox.mapbox-streets-v8',
                  },
                  subdomains: ['a', 'b', 'c'],
                ),

          //       CurrentLocationLayer(
          //   positionStream: const LocationMarkerDataStreamFactory()
          //       .fromGeolocatorPositionStream(
          //     stream: Geolocator.getPositionStream(
          //       locationSettings: const LocationSettings(
          //         accuracy: LocationAccuracy.medium,
          //         distanceFilter: 50,
          //         timeLimit: Duration(minutes: 1),
          //       ),
          //     ),
          //   ),
          // ),

                new MarkerLayer(
                  markers: list_markers,
                ),
              ],
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
}