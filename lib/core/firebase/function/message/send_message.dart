import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/core/firebase/firebase_option/firebase_options.dart';
import 'package:cyberbee_web/core/firebase/function/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendPushNotification {
  Future<void> sendAllNotification(String title, String message,String? url) async {
    final devices = await FirebaseFirestore.instance.collection('users').get();
    for (var device in devices.docs) {
      UserDetails(userId: device.id).sendPersonalNotification(
        message,
        url??'https://www.youtube.com/watch?v=OS1tdN9BuvY',
      );
      try {
        sendMessage(
          title: title,
          message: message,
          toUserId: device['messageId'],
        );
      } catch (_) {}
    }
  }

  Future<void> sendMessage({
    required String title,
    required String message,
    required String toUserId,
  }) async {
    final body = {
      "to": toUserId,
      "notification": <String, String>{
        "title": title,
        "body": message,
      },
    };
    var url = Uri.parse(PushNKey.url);
    try {
      await http
          .post(
            url,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader: PushNKey.getKey(),
            },
            body: jsonEncode(body),
          )
          .then(
            (value) => debugPrint(
              value.statusCode.toString(),
            ),
          );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
