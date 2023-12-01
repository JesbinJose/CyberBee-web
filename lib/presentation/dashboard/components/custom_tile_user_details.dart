import 'package:flutter/material.dart';

class CustomTextWidgetProfile extends StatelessWidget {
  const CustomTextWidgetProfile({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$title ',
            ),
          ),
          SizedBox(
            width: 250,
            child: Text(
              '-   $subTitle',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}