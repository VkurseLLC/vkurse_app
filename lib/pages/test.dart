

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong/latlong.dart';
// // import "package:latlong/latlong.dart" as latLng;
// // import 'package:latlng/latlng.dart';
// // import 'package:flutter_latlong/flutter_latlong.dart';


// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
// class _MapScreenState extends State<MapScreen> {
//   final mapController = MapController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FlutterMap(
//         mapController: mapController,
//         options: MapOptions(
//           center: latLng.LatLng(51.5074, 0.1278), //LatLng(51.5074, 0.1278),
//           // zoom: 13.0,
//           // maxZoom: 18.0,
//           // minZoom: 3.0,
//         ),
//         layers: [
//           TileLayerOptions(
//             urlTemplate:
//                 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token={accessToken}',
//             additionalOptions: {
//               'accessToken': 'pk.eyJ1Ijoib2xhcmRhbmlpbCIsImEiOiJjbGYyYXFjMTMwZ2tnM3NsanZ6bWR0bDA3In0.SLgCbOS8OGxB1D3JiYCi7Q',
//               'id': 'mapbox.streets',
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }