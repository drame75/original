import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({Key? key}) : super(key: key);

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(37.773972, -122431297), zoom: 11.5);
  late GoogleMapController _googleMapController;

  // late Marker _origine;
  // late Marker destination;
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('google map')),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
        target: LatLng(22.5448131, 88.3403691),
        zoom: 15,
      )),
    );
  }
}
