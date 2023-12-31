import 'package:cyberbee_web/application/bloc/course/edit_course/edit_course_bloc.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/courses/widgets/course_edit_view_control.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCourseWidget extends StatelessWidget {
  const EditCourseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: GridView.builder(
        itemCount: 2,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 1 : 2,
          childAspectRatio: Responsive.getWidthRatio(
            mobile: 0.7,
            tablet: 0.73,
            desktop: 0.9,
            context: context,
          ),
          crossAxisSpacing: defaultPadding * 2,
          mainAxisSpacing: defaultPadding,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            child: Center(
              child: Container(
                width: 450,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: BlocBuilder<EditCourseBloc, EditCourseState>(
                  builder: (context, state) {
                    return index == 0
                        ? CourseEditView(
                            type: state.first,
                            course: state.course,
                            level: state.level,
                          )
                        : CourseEditView(
                            type: state.second,
                            course: state.course,
                            isFirst: false,
                            level: state.level,
                          );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
