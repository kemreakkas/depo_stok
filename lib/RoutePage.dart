// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Routepage extends StatefulWidget {
  @override
  _RoutepageState createState() => _RoutepageState();
}

class _RoutepageState extends State<Routepage> {
  Position? _currentPosition;
  String _currentAddress = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Servislerin etkin olup olmadığını kontrol et
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Konum servisleri etkin değilse, kullanıcıya bildirimde bulun
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // İzin verilmediyse, kullanıcıya bildirimde bulun
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // İzin kalıcı olarak reddedildiyse, kullanıcıya bildirimde bulun
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Konum bilgisini al
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });

    // Adresi al (opsiyonel)
    // _getAddressFromLatLng(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Güzergah'),
      ),
      body: Center(
        child: _currentPosition == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}'),
                  const SizedBox(height: 20),
                  Text('Address: $_currentAddress'),
                ],
              ),
      ),
    );
  }

// Adres almak için (opsiyonel)
/*Future<void> _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            "${place.street}, ${place.locality}, ${place postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }*/
}
