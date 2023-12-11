import 'package:cyberbee_web/core/firebase/function/events/events.dart';
import 'package:cyberbee_web/presentation/events/widgets/event_tile.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: StreamBuilder(
            stream: MyFirebaseEvents.getAllEvents(),
            builder: (context, snapshot) {
              if (snapshot.data == null) return const SizedBox();
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final event = snapshot.data!.docs[index];
                  return EventTile(event: event);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}


