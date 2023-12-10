import 'package:cyberbee_web/application/bloc/drawer_control/drawer_control_bloc.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.index,
    required this.scaffoldkey,
  }) : super(key: key);

  final String title, svgSrc;
  final int index;
  final GlobalKey<ScaffoldState> scaffoldkey;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<DrawerControlBloc>().add(
              ChangeScreen(
                screenIndex: index,
              ),
            );
        if (!Responsive.isDesktop(context)) {
          scaffoldkey.currentState!.closeDrawer();
        }
      },
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: const ColorFilter.mode(
          Colors.white54,
          BlendMode.srcIn,
        ),
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
