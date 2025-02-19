import 'package:flutter/material.dart';

class BtnBlue extends StatelessWidget {
  final String? title;
  final Function()? onPressed;

  const BtnBlue({super.key, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 2,
            shape: const StadiumBorder()),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.login, size: 25, color: Colors.white),
              const SizedBox(width: 8),
              Center(
                  child: Text(title!,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center))
            ],
          ),
        ));
  }
}
