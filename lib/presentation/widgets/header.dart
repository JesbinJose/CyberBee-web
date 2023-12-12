import 'package:cyberbee_web/presentation/main/widgets/profile_card.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
    required this.scaffoldKey,
  }) : super(key: key);
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
          const ProfileCard()
        ],
      ),
    );
  }
}
