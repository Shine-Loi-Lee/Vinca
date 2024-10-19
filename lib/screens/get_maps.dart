import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vinca/app_assets/fonts.dart';
import 'package:vinca/screens/photo_edit.dart';
import 'package:geocoding/geocoding.dart';

class GetMaps extends StatefulWidget {
  const GetMaps({super.key});

  @override
  GetMapsState createState() => GetMapsState();
}

class GetMapsState extends State<GetMaps> {
  GoogleMapController? mapController;
  TextEditingController searchController = TextEditingController();

  String _selectedDivision = 'Province';
  final Set<Polygon> _polygons = {};
  LatLng? _searchedLocation;
  Polygon? _highlightedPolygon;

  bool _isLocationPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  // Method to request location permission
  Future<void> _requestLocationPermission() async {
    // Request location permission
    PermissionStatus status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      // Permission granted
      print('Location permission granted');
      setState(() {
        _isLocationPermissionGranted = true;
      });
    } else {
      // Permission denied
      print('Location permission denied');
      setState(() {
        _isLocationPermissionGranted = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Location permission is required to show your location.'),
        ),
      );
    }
  }

  // Called when the map is tapped
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    controller.setMapStyle(_mapStyle);
    _loadBoundaryData();
  }

// todo: Unexpected error, but the code works fine
  // Method to search for a location
  Future<void> _searchLocation() async {
    String query = searchController.text;
    if (query.isEmpty) return;

    try {
      // Search for the location
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        Location location = locations.first;

        if (mapController != null) {
          try {
            setState(() {
              _searchedLocation = LatLng(location.latitude, location.longitude);
            });

            // Animate the camera to the searched location
            await mapController!.animateCamera(CameraUpdate.newLatLngZoom(
              LatLng(location.latitude, location.longitude),
              12.0,
            ));

            // Highlight for the searched location
            _highlightSearchedLocation(location.latitude, location.longitude);
          } catch (cameraError) {
            print('Camera animation error: ${cameraError.toString()}');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error animating camera'),
              ),
            );
          }
        } else {
          print('Map controller is not initiaized.');
        }
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('location_not_found'.tr()),
        ),
      );
    }
  }

  // Method to highlight the searched location
  void _highlightSearchedLocation(double lat, double lng) {
    setState(() {
      _polygons.clear();

      _polygons.add(
        Polygon(
          polygonId: const PolygonId('searched_area'),
          points: [
            LatLng(lat - 0.01, lng - 0.01),
            LatLng(lat - 0.01, lng + 0.01),
            LatLng(lat + 0.01, lng + 0.01),
            LatLng(lat + 0.01, lng - 0.01),
          ],
          strokeColor: Colors.orange,
          fillColor: Colors.orange.withOpacity(0.5),
          strokeWidth: 2,
        ),
      );
    });
  }

  // Method to load boundary data based on the selected division
  Future<void> _loadBoundaryData() async {
    setState(() {
      _polygons.clear();
      if (_selectedDivision == 'City') {
        _polygons.add(
          Polygon(
            polygonId: const PolygonId('sample_city'),
            points: const [
              LatLng(40.7128, -74.0060),
              LatLng(40.7357, -74.0060),
              LatLng(40.7357, -74.1724),
              LatLng(40.7128, -74.1724),
            ],
            strokeColor: Colors.blue,
            fillColor: Colors.blue.withOpacity(0.5),
            strokeWidth: 2,
          ),
        );
      } else if (_selectedDivision == 'District') {
        _polygons.add(
          Polygon(
            polygonId: const PolygonId('sample_district'),
            points: const [
              LatLng(40.7128, -74.0060),
              LatLng(40.7357, -74.0060),
              LatLng(40.7357, -74.1724),
              LatLng(40.7128, -74.1724),
            ],
            strokeColor: Colors.red,
            fillColor: Colors.red.withOpacity(0.5),
            strokeWidth: 2,
          ),
        );
      } else if (_selectedDivision == 'Province') {
        _polygons.add(
          Polygon(
            polygonId: const PolygonId('sample_province'),
            points: const [
              LatLng(40.7128, -74.0060),
              LatLng(40.7357, -74.0060),
              LatLng(40.7357, -74.1724),
              LatLng(40.7128, -74.1724),
            ],
            strokeColor: Colors.green,
            fillColor: Colors.green.withOpacity(0.5),
            strokeWidth: 2,
          ),
        );
      }
    });
  }

// // Method to load boundary data for a specific location
//   Future<void> _loadBoundaryDataForLocation(double lat, double lng) async {
//     setState(() {
//       _polygons.clear();
//       _polygons.add(
//         Polygon(
//           polygonId: const PolygonId('searched_area'),
//           points: [
//             LatLng(lat - 0.01, lng - 0.01),
//             LatLng(lat - 0.01, lng + 0.01),
//             LatLng(lat + 0.01, lng + 0.01),
//             LatLng(lat + 0.01, lng - 0.01),
//           ],
//           strokeColor: Colors.orange,
//           fillColor: Colors.orange.withOpacity(0.5),
//           strokeWidth: 2,
//           consumeTapEvents: true,
//           onTap: () {
//             _onMapTapped(LatLng(lat, lng));
//           },
//         ),
//       );
//     });
//   }

// Method to handle map tap events
  void _onMapTapped(LatLng position) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PhotoEditPage(position: position)),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // Custom map style
  final String _mapStyle = '''
  [
    {
      "featureType": "all",
      "elementType": "labels",
      "stylers": [
        {
          "visibility": "simplified"
        },
        {
          "color": "#000000"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "transit",
      "elementType": "geometry",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry.stroke",
      "stylers": [
        {
          "color": "#0000FF"
        },
        {
          "weight": 2
        }
      ]
    },
    {
      "featureType": "administrative.locality",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#000000"
        }
      ]
    }
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'get_maps'.tr(),
            style: GoogleFontsInter.textStyle(
              color: const Color(0XFFA2DBEE),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              _onMapCreated(controller);
              controller.setMapStyle(_mapStyle);
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(40.7128, -74.0060), // Initial location: New York
              zoom: 1.0,
            ),
            myLocationEnabled: _isLocationPermissionGranted,
            myLocationButtonEnabled: _isLocationPermissionGranted,
            polygons: _polygons,
            onTap: _onMapTapped,
          ),

          // Search bar
          Positioned(
            top: 10,
            left: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'search'.tr(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchLocation,
                  ),
                  border: InputBorder.none,
                ),
                onSubmitted: (value) => _searchLocation(),
              ),
            ),
          ),

          // Division dropdown
          Positioned(
            top: 60,
            left: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                value: _selectedDivision,
                isExpanded: true,
                items: ['Province', 'City', 'District'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.tr()),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedDivision = newValue;
                      _loadBoundaryData();
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
