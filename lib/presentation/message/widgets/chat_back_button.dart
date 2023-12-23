
import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class ChatBackButton extends StatelessWidget {
  const ChatBackButton({
    super.key,
    required this.chats,
  });

  final ValueNotifier<String?> chats;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: secondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              chats.value = null;
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
