import 'package:cyberbee_web/application/function/date_time.dart';
import 'package:cyberbee_web/core/firebase/chat/chat.dart';
import 'package:cyberbee_web/core/firebase/chat/chat_models.dart';
import 'package:cyberbee_web/presentation/message/widgets/message_tile.dart';
import 'package:cyberbee_web/presentation/message/widgets/single_date_tile.dart';
import 'package:flutter/material.dart';

class SingleChatWidget extends StatelessWidget {
  const SingleChatWidget({
    super.key,
    required this.chats,
  });

  final ValueNotifier<String?> chats;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: chats,
      builder: (context, v, _) {
        if (v == null) return const SizedBox();
        return StreamBuilder(
          stream: ChatControls().getMessages(v),
          builder: (context, snapshot) {
            if (snapshot.data == null) return const SizedBox();
            final messages = snapshot.data!.docs.reversed.toList();
            return ListView.separated(
              reverse: true,
              controller: ScrollController(),
              padding: const EdgeInsets.only(bottom: 80),
              itemBuilder: (context, index) {
                final Message message = Message.fromMap(
                  messages[index],
                );
                String? date;
                if (index > 0) {
                  date = getDate(
                    message.dateAndTime,
                    Message.fromMap(
                      messages[index - 1],
                    ).dateAndTime,
                    index == messages.length - 1,
                  );
                }
                return Column(
                  children: [
                    if (date != null && index == messages.length - 1)
                      MessageDateTile(date: date),
                    SingleMessageTile(
                      isuser: message.touserId != 'true',
                      message: message,
                    ),
                    if (date != null && index != messages.length - 1)
                      MessageDateTile(date: date),
                  ],
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
    );
  }
}
