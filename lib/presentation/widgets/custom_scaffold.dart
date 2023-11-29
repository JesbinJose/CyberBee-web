import 'package:cyberbee_web/constants/images.dart';
import 'package:flutter/material.dart';

class MyCoustomScaffold extends StatelessWidget {
  final Widget child;
  const MyCoustomScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AssetsImages.backgroundImage,
          ),
        ),
      ),
      child: child,
    );
  }
}
