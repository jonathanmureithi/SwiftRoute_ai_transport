import 'package:flutter/material.dart';

class RouteResultScreen extends StatelessWidget {
  final String destination;
  final String routeSummary;
  final String transportMode; // Add transport mode

  const RouteResultScreen({
    Key? key,
    required this.destination,
    required this.routeSummary,
    required this.transportMode, 
  }) : super(key: key);

 @override
Widget build(BuildContext context) {
  List<String> lines = routeSummary.split('\n');

  final List<IconData> routeIcons = [
    Icons.directions_bus,
    Icons.access_time,
    Icons.attach_money,
  ];

  return Scaffold(
    appBar: AppBar(title: const Text('Route Summary')),
    body: Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            'lib/assets/images/background.png',
            fit: BoxFit.cover,
          ),
        ),
        // Content
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Destination: $destination',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Transport Mode: $transportMode',
                style: const TextStyle(fontSize: 18, color: Colors.blueAccent),
              ),
              const SizedBox(height: 20),
              ...lines.asMap().entries.map(
                (entry) => Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Icon(
                      routeIcons[entry.key % routeIcons.length],
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      entry.value,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Image.asset(
                'lib/assets/images/Screenshot.png',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
             const SizedBox(height: 20),
Center(
  child: ElevatedButton.icon(
    onPressed: () => Navigator.pop(context),
    icon: Icon(Icons.arrow_back),
    label: Text("Plan Another Route"),
  ),
),

            ],
          ),
        ),  
    ),
      ],
    ),
  );

}
}
