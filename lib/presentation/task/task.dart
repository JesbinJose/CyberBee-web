import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/components/header.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: 'Task',),
            SizedBox(height: defaultPadding,),
          ],
        ),
      ),
    );
  }
}