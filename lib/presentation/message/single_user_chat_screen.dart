import 'package:intl/intl.dart';

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
                              if (date != null)
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black,
                                    ),
                                    child: Text(date),
                                  ),
                                ),
                              SingleMessageTile(
                                isuser: message.touserId != 'true',
                                message: message,
                              ),
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
              ),
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

  String? getDate(DateTime date, DateTime old, bool isLast) {
    DateFormat format = DateFormat("MMMM dd, yyyy");
    if (isLast) return format.format(date);
    final int diff = date.difference(old).inDays;
    if (diff != 0) {
      final int datediff = old.difference(DateTime.now()).inDays;
      if (datediff == 0) {
        return 'Today';
      } else if (datediff == 1) {
        return 'Yesterday';
      } else {
        return format.format(date);
      }
    }
    return null;
  }
}
