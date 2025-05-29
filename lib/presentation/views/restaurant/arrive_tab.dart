import 'dart:async';

import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class ArriveTab extends StatefulWidget {
  final RestaurantEntity restaurant;
  const ArriveTab(
    this.restaurant, {
    super.key,
  });

  @override
  State<ArriveTab> createState() => _ArriveTabState();
}

class _ArriveTabState extends State<ArriveTab> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late CameraPosition _restaurantLocation;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
     _restaurantLocation = CameraPosition(
      target: LatLng(widget.restaurant.latitude, widget.restaurant.longitude),
      zoom: 17,
    );
  }

  Future<bool> _requestLocationPermission() async {
    var status = await Permission.location.status;

    if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      status = await Permission.location.request();
    }

    return status.isGranted;
  }

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
              initialCameraPosition: _restaurantLocation,
              markers: {
                Marker(
                  markerId: MarkerId('restaurantLocation'),
                  position: _restaurantLocation.target,
                  infoWindow: InfoWindow(
                  title: widget.restaurant.name,
                  snippet: 'Restaurant Location',
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
                ),
              },
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
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Text(
              widget.restaurant.routeIndications,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}