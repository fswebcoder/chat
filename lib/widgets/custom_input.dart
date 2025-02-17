import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();
  CustomInput({super.key});
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
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: 'Email',
            prefixIcon: Icon(Icons.mail_outline,
                color: _focusNode.hasFocus ? Colors.blue : Colors.grey),
            contentPadding: const EdgeInsets.symmetric(vertical: 15)),
        onTap: () {},
      ),
    );
  }
}
