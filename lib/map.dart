import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  late CameraPosition _kGooglePlex;
  List<Marker> _markers = []; // Changed _marker to _markers
  List<Marker> _list = [
    Marker(
      draggable: true,
      markerId: MarkerId('1'),
      position: LatLng(27.5981, 78.0492),
      infoWindow: InfoWindow(
        title: "My Position",
      ),
    )
  ];

  @override
  void initState() {
    super.initState();
    _markers.addAll(_list); // Used addAll to add markers
    _kGooglePlex = CameraPosition(
      target: LatLng(27.5981, 78.0492),
      zoom: 17.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          markers: Set<Marker>.of(_markers), // Used _markers here
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
