import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  final FocusNode _focusNode = FocusNode();
  CustomInput(
      {super.key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(left: 5, top: 5, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 5))
        ],
      ),
      child: TextField(
        focusNode: _focusNode,
        obscureText: isPassword,
        autocorrect: false,
        controller: textController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeholder,
            prefixIcon: Icon(icon,
                color: _focusNode.hasFocus ? Colors.blue : Colors.grey),
            contentPadding: const EdgeInsets.symmetric(vertical: 15)),
        onTap: () {},
      ),
    );
  }
}
