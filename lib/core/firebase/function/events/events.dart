import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/core/firebase_storage/upload_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyFirebaseEvents {
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static Stream<QuerySnapshot> getAllEvents() {
    return _instance.collection('events').snapshots();
  }

  static Future<void> addEvent(
      Uint8List image, String link, BuildContext context) async {
    final String? imageLink =
        await FireBaseStorage.uploadEventImage(
      context,
      file: image,
    );
    await _instance.collection('events').add({
      'image': imageLink,
      'link': link,
    });
  }
}
