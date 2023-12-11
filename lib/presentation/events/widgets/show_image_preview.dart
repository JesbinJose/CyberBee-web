import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowSelectedEventImage extends StatelessWidget {
  const ShowSelectedEventImage({
    super.key,
    required this.value,
  });
  final QueryDocumentSnapshot<Object?> value;

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
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        child: Image.network(
          value['image'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}