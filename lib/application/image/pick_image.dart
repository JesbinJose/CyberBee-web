import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickProfilePicture {
  static Future<Uint8List?> pickImage(BuildContext context) async {
    return await ImagePicker().pickImage(source: ImageSource.gallery).then(
      (image) {
        if (image == null) {
          //to do i the there is no image picked
          return null;
        } else {
          return image.readAsBytes();
        }
      },
    );
  }
}