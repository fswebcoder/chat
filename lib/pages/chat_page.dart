import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();
  var isWriting = false;

  final List<ChatMessage> _messages = [];

  @override
  void dispose() {
    for (final message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                maxRadius: 14,
                child: const Text('Te', style: TextStyle(fontSize: 12)),
              ),
              const SizedBox(height: 3),
              const Text('Fabio sánchez',
                  style: TextStyle(color: Colors.black87, fontSize: 12))
            ],
          )),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, i) => _messages[i],
                itemCount: _messages.length,
                reverse: true,
              ),
            ),
            const Divider(height: 1),
            Container(
              color: Colors.white,
              height: 50,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Flexible(
                  child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Mensaje...',
                  border: InputBorder.none,
                ),
                onSubmitted: _handleSubmitted,
                onChanged: (value) {
                  setState(() {
                    if (value.trim().isNotEmpty) {
                      isWriting = true;
                    } else {
                      isWriting = false;
                    }
                  });
                },
                focusNode: _focusNode,
              )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Platform.isIOS
                    ? CupertinoButton(
                        child: const Text('Enviar'),
                        onPressed: isWriting
                            ? () =>
                                _handleSubmitted(_textEditingController.text)
                            : null,
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.blue[400]),
                          child: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: isWriting
                                ? () => _handleSubmitted(
                                    _textEditingController.text)
                                : null,
                          ),
                        ),
                      ),
              )
            ],
          )),
    );
  }

  void _handleSubmitted(String value) {
    if (value.isEmpty) return;
    _textEditingController.clear();
    final newMessage = ChatMessage(
        uid: '123',
        text: value,
        animationController: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 400)));
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    _textEditingController.clear();
    _focusNode.requestFocus();
    setState(() {
      isWriting = false;
    });
  }
}
