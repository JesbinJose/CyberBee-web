
import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

import '../../../core/firebase/chat/chat_models.dart';

class SingleMessageTile extends StatelessWidget {
  const SingleMessageTile({
    super.key,
    required this.isuser,
    required this.message,
  });

  final bool isuser;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isuser
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: isuser
              ? primaryColor
              : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
            bottomLeft: isuser
                ? const Radius.circular(10)
                : Radius.zero,
            bottomRight: isuser
                ? Radius.zero
                : const Radius.circular(10),
          ),
        ),
        child: Text(
          message.message,
        ),
      ),
    );
  }
}