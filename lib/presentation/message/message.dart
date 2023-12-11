import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Container(
        color: secondaryColor,
        child: Row(
          children: [
            Container(
              width: 100,
            ),
            const VerticalDivider(),
            Container(width: 100),
          ],
        ),
      ),
    );
  }
}
