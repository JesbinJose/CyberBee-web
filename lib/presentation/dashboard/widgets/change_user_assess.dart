import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class ChangeUserAccessButton extends StatelessWidget {
  const ChangeUserAccessButton({
    super.key,
    required this.usertype,
  });

  final ValueNotifier<UserType> usertype;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserType>(
        valueListenable: usertype,
        builder: (_, value, __) {
          return DropdownButton(
            value: value,
            items: const [
              DropdownMenuItem(
                value: UserType.student,
                child: Text('Student'),
              ),
              DropdownMenuItem(
                value: UserType.tutor,
                child: Text('Tutor'),
              ),
              DropdownMenuItem(
                value: UserType.admin,
                child: Text('Admin'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                usertype.value = value;
              }
            },
          );
        });
  }
}

