import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: 500,
        width: 500,
        child: GoogleMap( initialCameraPosition: CameraPosition(

            zoom: 12,
            target: LatLng(10.9760, 76.2254))),
      ),
    );
  }
}
