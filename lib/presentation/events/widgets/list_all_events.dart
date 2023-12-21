import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/core/firebase/function/events/events.dart';
import 'package:cyberbee_web/presentation/events/widgets/event_tile.dart';
import 'package:flutter/material.dart';

class ListEvents extends StatelessWidget {
  const ListEvents({
    super.key,
    required this.event,
  });
  final ValueNotifier<QueryDocumentSnapshot?> event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: StreamBuilder(
        stream: MyFirebaseEvents.getAllEvents(),
        builder: (context, snapshot) {
          if (snapshot.data == null) return const SizedBox();
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length + 1,
            itemBuilder: (context, index) {
              final event = index != 0 ? snapshot.data!.docs[index - 1] : null;
              return EventTile(
                event: event,
                valueNotifier: this.event,
              );
            },
          );
        },
      ),
    );
  }
}
