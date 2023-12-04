import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/widgets/custom_container_top_view.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: double.infinity,
          child: GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
              childAspectRatio: Responsive.isMobile(context) ? 3.5 : 3,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
            ),
            itemBuilder: (context, index) => CustomTopViewContainer(
                onTap: () {},
                child: const Text(''),
              ),
          ),
        ),
      ],
    );
  }
}
