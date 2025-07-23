import 'package:flutter/material.dart';
import 'route_result_screen.dart';
import 'utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DestinationInputScreen extends StatefulWidget {
  const DestinationInputScreen({super.key});

  @override
  State<DestinationInputScreen> createState() => DestinationInputScreenState();
}

class DestinationInputScreenState extends State<DestinationInputScreen> {
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final List<String> _transportModes = ['Matatu', 'Car', 'Walking'];
  String _selectedMode = 'Matatu';
  bool _isLoading = false;

  void _simulateRouteSearch() async {
    final destination = destinationController.text.trim();
    final from = fromController.text.trim();

    if (destination.isEmpty || from.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));
    final routeSummary = getSimulatedRoute(
      destination,
       from: from,
        mode: _selectedMode,
      );

    setState(() => _isLoading = false);

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => RouteResultScreen(
          destination: destination,
          routeSummary: routeSummary,
          transportMode: _selectedMode,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Destination'), centerTitle: true),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Where do you want to go?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: destinationController,
                    decoration: InputDecoration(
                      labelText: 'Enter destination',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.place),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: fromController,
                    decoration: InputDecoration(
                      labelText: 'From',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedMode,
                    decoration: const InputDecoration(
                      labelText: 'Mode of Transport',
                      border: OutlineInputBorder(),
                    ),
                    items: _transportModes.map((String mode) {
                      return DropdownMenuItem<String>(
                        value: mode,
                        child: Text(mode),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedMode = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  _isLoading
                      ? const Center(
                          child: SpinKitFadingCircle(
                            color: Color.fromARGB(255, 112, 255, 68),
                            size: 50.0,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: _simulateRouteSearch,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Get Route',
                            style: TextStyle(fontSize: 16),
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