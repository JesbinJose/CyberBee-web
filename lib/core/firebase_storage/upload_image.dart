import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseStorage {
  static Future<String?> upladCourseImage(
    final context, {
    required Uint8List file,
    required String courseId,
    
  }) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('course/$courseId.jpg');
      final metadata = SettableMetadata(contentType: 'image/png');
      await storageRef.putData(file, metadata);
      return await storageRef.getDownloadURL();
    } catch (e) {
      // mySnakbar(context, e.toString());
    }
    return null;
  }
  static Future<String?> uploadEventImage(
    final context, {
    required Uint8List file,
  }) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('events/${DateTime.now().microsecondsSinceEpoch}.jpg');
      final metadata = SettableMetadata(contentType: 'image/png');
      await storageRef.putData(file, metadata);
      return await storageRef.getDownloadURL();
    } catch (e) {
      // mySnakbar(context, e.toString());
    }
    return null;
  }
}
