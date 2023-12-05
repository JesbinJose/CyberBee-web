
import 'package:flutter/material.dart';

class UserProfileDetailsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const UserProfileDetailsTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          const Text("   -   "),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
