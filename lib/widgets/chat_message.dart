import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String uid;
  final AnimationController animationController;

  const ChatMessage(
      {super.key,
      required this.text,
      required this.uid,
      required this.animationController});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: animationController, curve: Curves.fastEaseInToSlowEaseOut),
      child: Container(
        child: uid == '123' ? _myMessage() : _notMyMessage(),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(right: 5, bottom: 5, left: 50),
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            color: Color(0xff4D9ef6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(40),
            )),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(right: 50, bottom: 5, left: 5),
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            color: Color(0xffE4E5E8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(40),
            )),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
