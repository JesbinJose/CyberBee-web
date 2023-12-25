import 'package:cyberbee_web/application/bloc/dashboard/manage_each_users/manage_single_user_dash_board_bloc.dart';
import 'package:cyberbee_web/application/type_check.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/widgets/single_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowUsersByTypeWidget extends StatelessWidget {
  const ShowUsersByTypeWidget({
    super.key,
    required this.type,
  });
  final UserType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 600,
      padding: const EdgeInsets.all(
        defaultPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: StreamBuilder(
        stream: getUserFunction(type),
        builder: (context, snapshot) {
          if (snapshot.data == null) return const Center(child: Text('Some Error occured'),);
          if (snapshot.data!.docs.isEmpty) return const Center(child: Text('No Users'),);
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final user = snapshot.data!.docs[index];
              return ListTile(
                onTap: () => context.read<ManageSingleUserDashBoardBloc>().add(
                      ChangeUser(
                        user: user,
                      ),
                    ),
                leading: CircleProfileView(profileUrl: user['profile_pic']),
                title: Text(
                  user['username'],
                ),
                subtitle: Text(
                  user.id,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
