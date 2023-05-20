import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  final Widget child;

  const GradientBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 28, 13, 3),
            Color.fromARGB(255, 85, 4, 16),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
