import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/message/widgets/all_chat_manage_widget.dart';
import 'package:cyberbee_web/presentation/message/widgets/chat_back_button.dart';
import 'package:cyberbee_web/presentation/message/widgets/message_send_part.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';

class SingleUserChatScreen extends StatelessWidget {
  const SingleUserChatScreen({
    super.key,
    required this.chats,
  });
  final ValueNotifier<String?> chats;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              child: SingleChatWidget(chats: chats),
            ),
            if (Responsive.isMobile(context)) ChatBackButton(chats: chats),
            ValueListenableBuilder(
              valueListenable: chats,
              builder: (context, v, _) {
                if (v == null) return const SizedBox();
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: secondaryColor,
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      minHeight: 70,
                      maxHeight: 200,
                    ),
                    child: BottomMessageSendPart(
                      userId: v,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
