import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/events/widgets/event_manage_control.dart';
import 'package:cyberbee_web/presentation/events/widgets/show_image_preview.dart';
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
          if (value == null) return const SizedBox();
          final TextEditingController controller = TextEditingController(
            text: value['link'],
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
                TextField(
                  controller: controller,
                  decoration: myFormFieldInputDecoration(
                    icon: null,
                    hintText: 'link',
                  ),
                ),
                SaveAndImageControls(
                  image: image,
                  controller: controller,
                  event: event,
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
