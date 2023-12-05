import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class ProfilePicSection extends StatelessWidget {
  const ProfilePicSection({
    super.key,
    required this.profilePicUrl,
  });

  final String profilePicUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                    10,
                  ),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    profilePicUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
        Positioned(
          top: 130,
          left: 20,
          child: Container(
            width: 100,
            height: 100,
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
                profilePicUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
