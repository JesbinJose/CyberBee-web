import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/application/image/pick_image.dart';
import 'package:cyberbee_web/core/firebase/function/events/events.dart';
import 'package:cyberbee_web/core/firebase/function/message/send_message.dart';
import 'package:cyberbee_web/presentation/widgets/custom_loading.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

class SaveAndImageControls extends StatelessWidget {
  const SaveAndImageControls({
    super.key,
    required this.image,
    required this.controller,
    required this.event,
  });

  final ValueNotifier<Uint8List?> image;
  final TextEditingController controller;
  final ValueNotifier<QueryDocumentSnapshot<Object?>?> event;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 40,
        ),
        CustomTextButton(
          onTap: () async {
            await PickProfilePicture.pickImage(context).then((value) {
              image.value = value;
            });
          },
          content: 'Change Image',
        ),
        CustomTextButton(
          onTap: () async {
            if (image.value != null && controller.text.isNotEmpty) {
              showLoading(context);
              if (event.value == null) {
                await MyFirebaseEvents.addEvent(
                  image.value!,
                  controller.text,
                  context,
                ).then((value) => Navigator.pop(context));
              } else {
                await MyFirebaseEvents.updateEvent(
                  image.value!,
                  controller.text,
                  context,
                  event.value!.id,
                ).then((value) => Navigator.pop(context));
              }
              // ignore: use_build_context_synchronously
              mySnakbar(
                context,
                'Event ${event.value != null ? 'updated' : 'Added'}',
              );
            } else {
              mySnakbar(context, 'Problem With the Inputs');
              return;
            }
            image.value = null;
            SendPushNotification().sendAllNotification(
              'New Event',
              'There is a new event , Check out',
              controller.text,
            );
            controller.clear();
          },
          content: event.value == null ? 'Add' : 'Save',
        ),
        const SizedBox(
          width: 1,
        ),
      ],
    );
  }
}
