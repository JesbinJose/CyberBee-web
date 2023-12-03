import 'package:cyberbee_web/application/bloc/drawer_control/drawer_control_bloc.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> screens = [
      Scaffold(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
    ];
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: BlocBuilder<DrawerControlBloc, DrawerControlState>(
                builder: (context, state) {
                  return screens[state.screenIndex];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
