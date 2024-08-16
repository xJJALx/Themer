import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/images/welcome_cover.png',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        const Center(
          child: Text(
            'WELCOME !!!',
            style: TextStyle(fontSize: 26),
          ),
        ),
        const SizedBox(height: 100)
      ],
    );
  }
}
