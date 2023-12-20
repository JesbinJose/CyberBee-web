import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/core/firebase/chat/chat_models.dart';
import 'package:cyberbee_web/core/firebase/function/message/send_message.dart';

class ChatControls {
  ChatControls() {
    instance = FirebaseFirestore.instance.collection('chat');
  }
  late CollectionReference<Map<String, dynamic>> instance;
  Future<void> sendMessageToAdmin(Message message,String messageId) async {
    await instance
        .doc('toAdmin')
        .collection(message.fromUserId)
        .doc(message.dateAndTime.toString())
        .set(Message.toMap(message));
    SendPushNotification().sendMessage(
      title: 'Contact Us',
      message: message.message,
      toUserId: messageId,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String userId) {
    return instance.doc('toAdmin').collection(userId).snapshots();
  }
}
