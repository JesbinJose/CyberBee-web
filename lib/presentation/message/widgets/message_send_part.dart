import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/chat/chat.dart';
import 'package:cyberbee_web/core/firebase/chat/chat_models.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';

class BottomMessageSendPart extends StatelessWidget {
  BottomMessageSendPart({
    super.key,
    required this.userId,
  });
  final TextEditingController message = TextEditingController();
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Responsive.getWidthRatio(
            mobile: 260,
            tablet: 280,
            desktop: 300,
            context: context,
          ),
          child: TextField(
            controller: message,
            minLines: 1,
            maxLines: 50,
            decoration: const InputDecoration(
              hintText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: InkWell(
            onTap: () async {
              if (message.text.isNotEmpty) {
                final Message message = Message(
                  touserId: '',
                  dateAndTime: DateTime.now(),
                  message: this.message.text.trim(),
                  fromUserId: userId,
                );
                final messageId = (await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userId)
                        .get())
                    .data()?['messageId'];
                ChatControls().sendMessageToAdmin(message, messageId);
                this.message.text = '';
              }
            },
            child: Transform.rotate(
              angle: -0.7,
              child: const Icon(
                Icons.send,
              ),
            ),
          ),
        )
      ],
    );
  }
}
