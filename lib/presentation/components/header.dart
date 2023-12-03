import 'package:cyberbee_web/presentation/components/profile_card.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const ProfileCard()
      ],
    );
  }
}
