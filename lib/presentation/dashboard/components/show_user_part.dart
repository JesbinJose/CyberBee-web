import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class ShowUserInfoWidget extends StatelessWidget {
  final double width;
  const ShowUserInfoWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      width: width,
      height: 500,
      decoration:  BoxDecoration(
        borderRadius:const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }
}
