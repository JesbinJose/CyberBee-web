
import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class CircleProfileView extends StatelessWidget {
  const CircleProfileView({
    super.key,
    required this.profileUrl,
  });

  final String profileUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        child: Image.network(
          profileUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
