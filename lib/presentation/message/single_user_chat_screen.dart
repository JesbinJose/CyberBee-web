import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/chat/chat.dart';
import 'package:cyberbee_web/core/firebase/chat/chat_models.dart';
import 'package:cyberbee_web/presentation/message/widgets/chat_back_button.dart';
import 'package:cyberbee_web/presentation/message/widgets/message_send_part.dart';
import 'package:cyberbee_web/presentation/message/widgets/message_tile.dart';
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
              child: ValueListenableBuilder(
                valueListenable: chats,
                builder: (context, v, _) {
                  if (v == null) return const SizedBox();
                  return StreamBuilder(
                    stream: ChatControls().getMessages(v),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) return const SizedBox();
                      return ListView.separated(
                        reverse: true,
                        controller: ScrollController(),
                        padding: const EdgeInsets.only(bottom: 80),
                        itemBuilder: (context, index) {
                          final Message message = Message.fromMap(
                            snapshot.data!.docs.reversed.toList()[index],
                          );
                          return SingleMessageTile(
                            isuser: message.touserId != 'true',
                            message: message,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: snapshot.data!.docs.length,
                      );
                    },
                  );
                },
              ),
            ),
            if(Responsive.isMobile(context))
            ChatBackButton(chats: chats),
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
