import 'package:cyberbee_web/application/bloc/drawer_control/drawer_control_bloc.dart';
import 'package:cyberbee_web/presentation/courses/course.dart';
import 'package:cyberbee_web/presentation/dashboard/dashboard.dart';
import 'package:cyberbee_web/presentation/events/events.dart';
import 'package:cyberbee_web/presentation/widgets/header.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/side_menu.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> screens = <Widget>[
    const DashBoardScreen(),
    const Scaffold(),
    EventScreen(),
    const CourseScreen(),
  ];
  final List<String> titles = <String>[
    'Dashboard',
    'Message',
    'Events',
    'Course',
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(
                  scaffoldkey: _key,
                ),
              ),
            Expanded(
              // It takes 4/5 part of the screen
              flex: 4,
              child: BlocBuilder<DrawerControlBloc, DrawerControlState>(
                builder: (context, state) {
                  return Scaffold(
                    key: _key,
                    drawer: !Responsive.isDesktop(context)
                        ?  SideMenu(scaffoldkey: _key,)
                        : null,
                    appBar: PreferredSize(
                      preferredSize: const Size(
                        double.infinity,
                        70,
                      ),
                      child: Header(
                        title: titles[state.screenIndex],
                        scaffoldKey: _key,
                      ),
                    ),
                    body: screens[state.screenIndex],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
