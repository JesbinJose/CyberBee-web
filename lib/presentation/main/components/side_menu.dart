import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/main/components/single_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

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
          const DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            index: 0,
          ),
          const DrawerListTile(
            title: "Task",
            svgSrc: "assets/icons/task.svg",
            index: 1,
          ),
          const DrawerListTile(
            title: "Payment",
            svgSrc: "assets/icons/payment.svg",
            index: 2,
          ),
          const DrawerListTile(
            title: "Messages",
            svgSrc: "assets/icons/message.svg",
            index: 3,
          ),
          const DrawerListTile(
            title: "Activities",
            svgSrc: "assets/icons/activites.svg",
            index: 4,
          ),
          const DrawerListTile(
            title: "Content",
            svgSrc: "assets/icons/content.svg",
            index: 5,
          ),
        ],
      ),
    );
  }
}
