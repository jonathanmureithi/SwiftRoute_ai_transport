import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;

  const BackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The background image
        Positioned.fill(
          child: Image.asset(
            'lib/assets/images/background.png',
            fit: BoxFit.cover,
          ),
        ),
        // The content passed from outside
        child, // ← must be inside children list
      ],
    );
  }
}
