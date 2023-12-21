import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class CustomTopViewContainer extends StatelessWidget {
  const CustomTopViewContainer({
    super.key,
    required this.onTap,
    required this.child,
  });
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
