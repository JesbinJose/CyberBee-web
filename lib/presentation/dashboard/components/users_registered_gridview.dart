import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/dashboard/components/users_show_count_widget.dart';
import 'package:flutter/material.dart';

class UserRegiseteredGridView extends StatelessWidget {
  const UserRegiseteredGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1, required this.height,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final double height;

  @override
  Widget build(BuildContext context) {
    final List userTypes = [...UserType.values];
    return SizedBox(
      height: height,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: 3,
        ),
        itemBuilder: (context, index) => ShowUserCount(
          type: userTypes[index],
        ),
      ),
    );
  }
}
