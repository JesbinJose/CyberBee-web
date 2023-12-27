import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/events/events.dart';
import 'package:cyberbee_web/presentation/events/widgets/event_manage_control.dart';
import 'package:cyberbee_web/presentation/events/widgets/show_image_preview.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:cyberbee_web/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

class SingleEventEdit extends StatelessWidget {
  SingleEventEdit({
    super.key,
    required this.event,
  });

  final ValueNotifier<QueryDocumentSnapshot<Object?>?> event;
  final ValueNotifier<Uint8List?> image = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: 400,
      height: 500,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        color: secondaryColor,
      ),
      child: ValueListenableBuilder(
        valueListenable: event,
        builder: (_, value, __) {
          final TextEditingController controller = TextEditingController(
            text: value?['link'],
          );
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShowSelectedEventImage(
                  value: value,
                  image: image,
                ),
                CustomTextFormField(
                  controller: controller,
                  hintText: 'Link',
                  validator: (v) {
                    if (v == null || v.isEmpty) return null;
                    if (!RegExp(validUrl).hasMatch(v)) {
                      return 'Please enter a valid link';
                    }
                  },
                ),
                SaveAndImageControls(
                  image: image,
                  controller: controller,
                  event: event,
                ),
                if (event.value != null)
                  CustomTextButton(
                    onTap: () async {
                      await MyFirebaseEvents.removeEvent(event.value!.id).then(
                        (value) {
                          mySnakbar(
                            context,
                            'Event Deleted',
                          );
                        },
                      );
                      event.value = null;
                    },
                    content: 'Delete',
                  ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
