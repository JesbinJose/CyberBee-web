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
        Responsive(
          mobile: SizedBox(
            height: 200,
            child: UserRegiseteredGridView(
              crossAxisCount: size.width < 650 ? 2 : 4,
              childAspectRatio: size.width < 650 && size.width > 350 ? 1.3 : 1,
            ),
          ),
          tablet: const SizedBox(
            height: 100,
            child: UserRegiseteredGridView(),
          ),
          desktop: SizedBox(
            height: 100,
            child: UserRegiseteredGridView(
              childAspectRatio: size.width < 1400 ? 1.1 : 3,
            ),
          ),
        ),
      ],
    );
  }
}
