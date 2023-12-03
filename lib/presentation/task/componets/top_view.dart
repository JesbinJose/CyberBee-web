import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';

class TaskQuestionAndQuizControl extends StatelessWidget {
  const TaskQuestionAndQuizControl({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: defaultPadding,
        ),
        Responsive(
          mobile: TaskGridPart(
            screenWWithRatio: 1.7,
          ),
          desktop: TaskGridPart(
            screenWWithRatio: 2,
          ),
          tablet: TaskGridPart(
            screenWWithRatio: 2,
          ),
        ),
      ],
    );
  }
}

class TaskGridPart extends StatelessWidget {
  final double screenWWithRatio;
  const TaskGridPart({
    super.key,
    required this.screenWWithRatio,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 250 * screenWWithRatio,
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: 2,
            ),
            children: [
              CustomTaskTile(
                content: const Text("Assigments"),
                onTap: () {},
              ),
              CustomTaskTile(
                content: const Text("Quiz"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTaskTile extends StatelessWidget {
  const CustomTaskTile({
    super.key,
    required this.content,
    required this.onTap,
  });
  final Widget content;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          color: secondaryColor,
        ),
        child: Center(
          child: content,
        ),
      ),
    );
  }
}
