import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:flutter/widgets.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    required this.event,
  });

  final QueryDocumentSnapshot<Object?> event;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            child: Image.network(
              event['image'],
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}