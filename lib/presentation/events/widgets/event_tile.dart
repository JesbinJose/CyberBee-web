import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    required this.event,
    required this.valueNotifier,
  });

  final QueryDocumentSnapshot<Object?>? event;
  final ValueNotifier<QueryDocumentSnapshot?> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: InkWell(
        onTap: () => valueNotifier.value = event,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              child: event != null
                  ? Image.network(
                      event!['image'],
                      width: 200,
                      height: 120,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: 200,
                      height: 120,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: primaryColor,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
