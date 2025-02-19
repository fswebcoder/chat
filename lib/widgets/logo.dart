import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String message;
  const Logo({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: 220,
        child: Column(
          children: [
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(height: 20),
            Text(message, style: const TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
