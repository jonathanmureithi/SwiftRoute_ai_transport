import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationInputScreen extends StatefulWidget {
  @override
  _LocationInputScreenState createState() => _LocationInputScreenState();
}

class _LocationInputScreenState extends State<LocationInputScreen> {
  final fromController = TextEditingController();
  final toController = TextEditingController();

  String result = "";

  Future<void> calculateDistance() async {
    try {
      // Convert input to coordinates
      List<Location> fromLoc = await locationFromAddress(fromController.text);
      List<Location> toLoc = await locationFromAddress(toController.text);

      double distanceInMeters = Geolocator.distanceBetween(
        fromLoc.first.latitude,
        fromLoc.first.longitude,
        toLoc.first.latitude,
        toLoc.first.longitude,
      );

      double distanceInKm = distanceInMeters / 1000;

      setState(() {
        result = "Distance: ${distanceInKm.toStringAsFixed(2)} km";
      });
    } catch (e) {
      setState(() {
        result = "Error calculating distance: $e";
      });
    }
  }

  Future<void> useCurrentLocationAsStart() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];

    setState(() {
      fromController.text = "${place.locality}, ${place.country}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter Your Route")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fromController,
              decoration: InputDecoration(
                labelText: 'From',
                suffixIcon: IconButton(
                  icon: Icon(Icons.my_location),
                  onPressed: useCurrentLocationAsStart,
                ),
              ),
            ),
            TextField(
              controller: toController,
              decoration: InputDecoration(labelText: 'To'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateDistance,
              child: Text("Calculate Distance"),
            ),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}