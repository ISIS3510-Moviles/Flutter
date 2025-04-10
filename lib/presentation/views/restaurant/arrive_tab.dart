import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class ArriveTab extends StatefulWidget {
  const ArriveTab({super.key});

  @override
  State<ArriveTab> createState() => _ArriveTabState();
}

class _ArriveTabState extends State<ArriveTab> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<bool> _requestLocationPermission() async {
    var status = await Permission.location.status;

    if (status.isDenied) {
      status = await Permission.location.request();
    }
    return false;
  }

  static const CameraPosition _kUniversityLosAndes = CameraPosition(
    target: LatLng(4.60142035, -74.0649170096208),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 315,
            width: double.infinity,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kUniversityLosAndes,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              rotateGesturesEnabled: true,
              tiltGesturesEnabled: true,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer()),
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Exit the ML building, head down the Environmental Axis, one block before City U, turn right.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
