import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String titleOne;
  final String? titleTwo;
  final String ruta;
  const CustomLabel(
      {super.key, required this.titleOne, this.titleTwo, required this.ruta});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(titleOne,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, ruta);
          },
          child: Text(titleTwo!,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
