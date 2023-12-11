import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowSelectedEventImage extends StatelessWidget {
  const ShowSelectedEventImage({
    super.key,
    required this.value,
    required this.image,
  });
  final QueryDocumentSnapshot<Object?> value;
  final ValueNotifier<Uint8List?> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: ValueListenableBuilder(
        valueListenable: image,
        builder: (__, v, _) {
          return ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            child: image.value != null
                ? Image.memory(
                    image.value!,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    value['image'],
                    fit: BoxFit.cover,
                  ),
          );
        },
      ),
    );
  }
}
