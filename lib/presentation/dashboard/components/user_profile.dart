import 'package:cyberbee_web/application/bloc/dashboard/manage_each_users/manage_single_user_dash_board_bloc.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/user_details/user_details.dart';
import 'package:cyberbee_web/presentation/dashboard/components/custom_tile_user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileWidgetDashBoard extends StatelessWidget {
  const ProfileWidgetDashBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageSingleUserDashBoardBloc,
        ManageSingleUserDashBoardState>(
      builder: (context, state) {
        final user = state.user;
        if (user == null) return const SizedBox();
        return Column(
          children: [
            if (user['profile_pic']=='')
            const SizedBox(
              height: 200,
              child: Center(
                child: Text('No Profile Picture'),
              ),
            ),
            if (user['profile_pic'] != '')
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Positioned(
                        child: ClipRRect(
                          borderRadius: const BorderRadiusDirectional.vertical(
                            top: Radius.circular(
                              10,
                            ),
                          ),
                          child: Image.network(
                            user['profile_pic'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 30,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              100,
                            ),
                          ),
                          color: primaryColor,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              100,
                            ),
                          ),
                          child: Image.network(
                            user['profile_pic'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 50,
            ),
            CustomTextWidgetProfile(
              title: 'Username',
              subTitle: state.user!['username'],
            ),
            const Divider(),
            CustomTextWidgetProfile(
              title: 'UserId',
              subTitle: state.user!.id,
            ),
            const Divider(),
            StreamBuilder(
              stream: UserDetails(userId: user.id).getAllCourseInProgress(),
              builder: (context, snapshot) {
                List<String> list = [];
                for (var course in snapshot.data!.docs) {
                  list.add(course.id);
                }
                return CustomTextWidgetProfile(
                  title: 'Course In Progress',
                  subTitle:
                      list.isNotEmpty ? list.join('\n-   ') : 'No Courses',
                );
              },
            ),
          ],
        );
      },
    );
  }
}
