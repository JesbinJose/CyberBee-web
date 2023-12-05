import 'package:cyberbee_web/application/bloc/dashboard/manage_each_users/manage_single_user_dash_board_bloc.dart';
import 'package:cyberbee_web/application/bloc/dashboard/usercontrol/dash_board_selected_type_bloc.dart';
import 'package:cyberbee_web/application/type_check.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/dashboard/widgets/single_user_screen.dart';
import 'package:cyberbee_web/presentation/dashboard/widgets/user_type_count.dart';
import 'package:cyberbee_web/presentation/dashboard/widgets/usertype_all_list.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const CustomUserTypeCountWidget(),
          const SizedBox(
            height: defaultPadding,
          ),
          Container(
            margin: const EdgeInsets.all(
              defaultPadding,
            ),
            padding: const EdgeInsets.all(defaultPadding * 2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              color: secondaryColor,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<DashBoardSelectedTypeBloc,
                    DashBoardSelectedTypeState>(
                  builder: (context, state) {
                    return Text(
                      typeName(
                        state.userType,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                GridView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Responsive.isMobile(context) ? 1 : 2,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: defaultPadding * 2,
                    mainAxisSpacing: defaultPadding,
                  ),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Center(
                        child: index == 0
                            ? BlocBuilder<DashBoardSelectedTypeBloc,
                                DashBoardSelectedTypeState>(
                                builder: (context, state) {
                                  return ShowUsersByTypeWidget(
                                    type: state.userType,
                                  );
                                },
                              )
                            : BlocBuilder<ManageSingleUserDashBoardBloc,
                                ManageSingleUserDashBoardState>(
                                builder: (context, state) {
                                  if (state.user != null) {
                                    return SingleUserScreen(user: state.user!);
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
