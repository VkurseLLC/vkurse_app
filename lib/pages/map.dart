import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class Map extends StatefulWidget {
  @override
  _Map createState() => _Map();
}
class _Map extends State<Map> {
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;

    print("width: $width");

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
                      'https://api.mapbox.com/styles/v1/olardaniil/clf2cbkz3002g01q603c36r1k/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoib2xhcmRhbmlpbCIsImEiOiJjbGYyYW8zenkwMWk1M3JudG5jeW01ZHNoIn0.d5HskUsAcPfU479m_UAM0A',
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1Ijoib2xhcmRhbmlpbCIsImEiOiJjbGYyYW8zenkwMWk1M3JudG5jeW01ZHNoIn0.d5HskUsAcPfU479m_UAM0A',
                    'id': 'mapbox.mapbox-streets-v8',
                  },
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
                              height: 150,
                              child: Stack(
                                fit: StackFit.loose,
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
                                    bottom: 20.0,
                                    left: 30.0,
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      child: ElevatedButton(
                                        onPressed: (){}, 
                                        child: Icon(Icons.access_alarm),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                          ),
                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4A1A78)),
                                        )
                                      )
                                    ),
                                  ),

                                  Positioned(
                                    bottom: 40.0,
                                    left: 150.0,
                                    child: Container(
                                      width: 110,
                                      height: 110,
                                      child: ElevatedButton(
                                        onPressed: (){}, 
                                        child: Icon(Icons.access_alarm),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(24),
                                            ),
                                          ),
                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4A1A78)),
                                        )
                                      )
                                    ),
                                  ),

                                  Positioned(
                                    bottom: 20.0,
                                    right: 30.0,
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      child: ElevatedButton(
                                        onPressed: (){}, 
                                        child: Icon(Icons.access_alarm),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
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