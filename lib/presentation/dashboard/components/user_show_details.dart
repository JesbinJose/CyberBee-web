import 'package:cyberbee_web/responsive.dart';
import 'package:cyberbee_web/presentation/dashboard/components/users_registered_gridview.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class UsersDashboardDetails extends StatelessWidget {
  const UsersDashboardDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Users",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        SizedBox(
          height: 100,
          child: Responsive(
            mobile: UserRegiseteredGridView(
              crossAxisCount: size.width < 650 ? 2 : 4,
              childAspectRatio: size.width < 650 && size.width > 350 ? 1.3 : 1,
            ),
            tablet: const UserRegiseteredGridView(),
            desktop: UserRegiseteredGridView(
              childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
