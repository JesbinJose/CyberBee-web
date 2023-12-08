import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseStorage {
  static Future<String?> upladCourseImage(
    final context, {
    required File file,
    required String userId,
    
  }) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('profile_pics/$userId.jpg');
      final metadata = SettableMetadata(contentType: 'image/png');
      await storageRef.putData(file.readAsBytesSync(), metadata);
      return await storageRef.getDownloadURL();
    } catch (e) {
      // mySnakbar(context, e.toString());
    }
    return null;
  }
  static Future<String?> uploadEventImage(
    final context, {
    required File file,
  }) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('events/${DateTime.now().microsecondsSinceEpoch}.jpg');
      final metadata = SettableMetadata(contentType: 'image/png');
      await storageRef.putData(file.readAsBytesSync(), metadata);
      return await storageRef.getDownloadURL();
    } catch (e) {
      // mySnakbar(context, e.toString());
    }
    return null;
  }
}
