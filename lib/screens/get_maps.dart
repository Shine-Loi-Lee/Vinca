import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetMaps extends StatefulWidget {
  const GetMaps({super.key});

  @override
  _GetMapsState createState() => _GetMapsState();
}

class _GetMapsState extends State<GetMaps> {
  // late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Placeholder(),
    );
  }

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }
}
