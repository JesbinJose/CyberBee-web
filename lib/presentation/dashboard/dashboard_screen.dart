import 'package:cyberbee_web/presentation/dashboard/components/user_details_selected_type.dart';
import 'package:cyberbee_web/presentation/dashboard/components/user_show_details.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      UsersDashboardDetails(),
                      SizedBox(height: defaultPadding),
                      SingleTypeShowDetails(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
