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
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: UserRegiseteredGridView(
            height: 200,
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 && size.width > 350 ? 1.3 : 1,
          ),
          tablet: const UserRegiseteredGridView(height: 100,),
          desktop: UserRegiseteredGridView(height: 100,
            childAspectRatio: size.width < 1400 ? 1.1 : 3,
          ),
        ),
      ],
    );
  }
}
