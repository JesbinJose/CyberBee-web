import 'package:cyberbee_web/core/firebase/chat/chat.dart';
import 'package:cyberbee_web/core/firebase/chat/chat_models.dart';
import 'package:cyberbee_web/presentation/message/widgets/message_send_part.dart';
import 'package:cyberbee_web/presentation/message/widgets/message_tile.dart';
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
                        itemBuilder: (context, index) {
                          final Message message =
                              Message.fromMap(snapshot.data!.docs[index]);
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
            ValueListenableBuilder(
              valueListenable: chats,
              builder: (context, v, _) {
                if (v == null) return const SizedBox();
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
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
