// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/application/bloc/dashboard/manage_each_users/manage_single_user_dash_board_bloc.dart';
import 'package:cyberbee_web/application/type_check.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/dashboard/components/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowUserInfoWidget extends StatelessWidget {
  final double width;
  const ShowUserInfoWidget({
    super.key,
    required this.width,
    required this.type,
    this.isProfile = true,
  });
  final UserType type;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      width: width,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        color: Colors.white.withOpacity(0.1),
      ),
      child: !isProfile
          ? FutureBuilder(
              future: getUserFunction(type),
              builder: (context, snapshot) {
                if (snapshot.data == null) return const SizedBox();
                return ListView.builder(
                  padding: const EdgeInsets.all(defaultPadding),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final QueryDocumentSnapshot<Object?> user =
                        snapshot.data![index];
                    return ListTile(
                      onTap: () => context
                          .read<ManageSingleUserDashBoardBloc>()
                          .add(ChangeUser(user: user)),
                      title: Text(user['username']),
                      subtitle: Text(user.id),
                      leading: Container(
                        padding: const EdgeInsets.all(2),
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              25,
                            ),
                          ),
                          color: primaryColor,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              25,
                            ),
                          ),
                          child: Image.network(
                            user['profile_pic'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : const ProfileWidgetDashBoard(),
    );
  }
}
