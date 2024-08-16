import 'package:flutter/material.dart';

class Signature extends StatelessWidget {
  const Signature({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 48,
          right: 0,
          child: Text(
            'xJJALx',
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
