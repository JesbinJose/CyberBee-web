import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/presentation/events/widgets/list_all_events.dart';
import 'package:cyberbee_web/presentation/events/widgets/single_event_edit_part.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  EventScreen({super.key});
  final ValueNotifier<QueryDocumentSnapshot?> event = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: Responsive.isMobile(context)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          ListEvents(event: event),
          SingleEventEdit(event: event),
        ],
      ),
    );
  }
}


