import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/details/user_details.dart';
import 'package:cyberbee_web/core/firebase/function/user_details/user_details.dart';
import 'package:cyberbee_web/presentation/dashboard/widgets/change_user_assess.dart';
import 'package:cyberbee_web/presentation/dashboard/widgets/profile_pic_section.dart';
import 'package:cyberbee_web/presentation/dashboard/widgets/single_user_tile.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SingleUserScreen extends StatelessWidget {
  SingleUserScreen({
    super.key,
    required this.user,
  });
  final QueryDocumentSnapshot user;
  late UserType type;
  late ValueNotifier<UserType> usertype;

  @override
  Widget build(BuildContext context) {
    if (user['isAdmin']) {
      type = UserType.admin;
    } else if (user['isTutor']) {
      type = UserType.tutor;
    } else {
      type = UserType.student;
    }
    usertype = ValueNotifier(type);
    return Container(
      width: 450,
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Column(
        children: [
          ProfilePicSection(
            profilePicUrl: user['profile_pic'],
          ),
          UserProfileDetailsTile(
            title: 'Username',
            subtitle: user['username'],
          ),
          StreamBuilder(
            stream: UserDetails(userId: user.id).getAllCourseInProgress(),
            builder: (context, snapshot) {
              final List<String> courses = [];
              if (snapshot.data != null) {
                for (var corse in snapshot.data!.docs) {
                  courses.add(corse.id);
                }
              }
              return UserProfileDetailsTile(
                title: 'Coures Taken',
                subtitle: courses.join('\n'),
              );
            },
          ),
          const SizedBox(height: 30),
          if (user.id != '')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Change access'),
                ChangeUserAccessButton(
                  usertype: usertype,
                ),
                CustomTextButton(
                  onTap: () async => await UserDetailsForAdmin.changeAccess(
                    userId: user.id,
                    isAdmin: usertype.value == UserType.admin,
                    isTutor: usertype.value == UserType.tutor,
                  ),
                  content: 'Save',
                ),
              ],
            ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                onTap: () {
                  UserDetailsForAdmin.deleteUser(
                    user['username'],
                    user.id,
                  );
                },
                content: 'Delete',
              ),
              const SizedBox(
                width: 45,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
