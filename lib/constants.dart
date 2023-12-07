import 'package:cyberbee_web/application/bloc/course/edit_course/edit_course_bloc.dart';
import 'package:cyberbee_web/application/bloc/dashboard/manage_each_users/manage_single_user_dash_board_bloc.dart';
import 'package:cyberbee_web/application/bloc/dashboard/usercontrol/dash_board_selected_type_bloc.dart';
import 'package:cyberbee_web/application/bloc/drawer_control/drawer_control_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

enum UserType { total, student, tutor, admin }

List<BlocProvider> providers = [
  BlocProvider<DashBoardSelectedTypeBloc>(
    create: (BuildContext context) => DashBoardSelectedTypeBloc(),
  ),
  BlocProvider<ManageSingleUserDashBoardBloc>(
    create: (BuildContext context) => ManageSingleUserDashBoardBloc(),
  ),
  BlocProvider<DrawerControlBloc>(
    create: (BuildContext context) => DrawerControlBloc(),
  ),
  BlocProvider<EditCourseBloc>(
    create: (BuildContext context) => EditCourseBloc(),
  ),
];

enum CourseEditType { course, level, part }

InputDecoration myFormFieldInputDecoration({
  required IconData? icon,
  required String hintText,
}) {
  return InputDecoration(
    prefixIcon: icon != null
        ? Icon(
            icon,
            color: Colors.white,
          )
        : null,
    hintText: hintText,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: bgColor.withOpacity(0.6),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: Colors.red.withOpacity(0.6),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: bgColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: Colors.red.withOpacity(0.6),
      ),
    ),
  );
}
