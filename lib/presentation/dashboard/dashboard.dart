import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/dashboard/widgets/show_user_by_type.dart';
import 'package:cyberbee_web/presentation/dashboard/widgets/user_type_count.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
           SizedBox(
            height: 30,
          ),
           CustomUserTypeCountWidget(),
           SizedBox(
            height: defaultPadding,
          ),
          DashboradUsersListWidget(),
        ],
      ),
    );
  }
}


