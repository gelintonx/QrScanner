import 'dart:async';

import 'package:QrScanner/models/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBody extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    var data = scan.value.split('geo:');
    var coordinates = data[1].split(',');
    print(coordinates[0]);
    final double latitude = double.parse(coordinates[0]);
    final double longitude = double.parse(coordinates[1]);
    final CameraPosition initialPoint =
        CameraPosition(target: LatLng(latitude, longitude), zoom: 14, tilt: 50);
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        initialCameraPosition: initialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
