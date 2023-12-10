import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/main/widgets/single_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.scaffoldkey,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldkey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 35,
                ),
                const SizedBox(width: defaultPadding - 6),
                Text(
                  'CYBERBEE',
                  style: GoogleFonts.bangers(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(width: defaultPadding - 6),
              ],
            ),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            index: 0,
            scaffoldkey: scaffoldkey,
          ),
          DrawerListTile(
            scaffoldkey: scaffoldkey,
            title: "Messages",
            svgSrc: "assets/icons/message.svg",
            index: 1,
          ),
          DrawerListTile(
            scaffoldkey: scaffoldkey,
            title: "Events",
            svgSrc: "assets/icons/activites.svg",
            index: 2,
          ),
          DrawerListTile(
            scaffoldkey: scaffoldkey,
            title: "Courses",
            svgSrc: "assets/icons/content.svg",
            index: 3,
          ),
        ],
      ),
    );
  }
}
