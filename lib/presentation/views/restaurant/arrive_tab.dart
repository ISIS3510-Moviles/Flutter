import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ArriveTab extends StatefulWidget {
  const ArriveTab({super.key});

  @override
  State<ArriveTab> createState() => _ArriveTabState();
}

class _ArriveTabState extends State<ArriveTab> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

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
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          SizedBox(height: 16,),
          SizedBox(
            width: double.infinity,
            child: Text('Exit the ML building, head down the Environmental Axis, one block before City U, turn right.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          
        ],
      ),
    );
  }
}