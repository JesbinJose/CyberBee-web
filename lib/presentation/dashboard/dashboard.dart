import 'package:cyberbee_web/application/bloc/dashboard/usercontrol/dash_board_selected_type_bloc.dart';
import 'package:cyberbee_web/application/type_check.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/widgets/custom_container_top_view.dart';
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
                        child: BlocBuilder<DashBoardSelectedTypeBloc,
                            DashBoardSelectedTypeState>(
                          builder: (context, state) {
                            return ShowUsersByTypeWidget(
                              type: state.userType,
                            );
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
      child: FutureBuilder(
        future: getUserFunction(type),
        builder: (context, snapshot) {
          if (snapshot.data == null) return const SizedBox();
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              return ListTile(
                leading: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.network(
                      user['profile_pic'],
                    ),
                  ),
                ),
                title: Text(
                  user['username'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomUserTypeCountWidget extends StatelessWidget {
  const CustomUserTypeCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        itemCount: 4,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          childAspectRatio: Responsive.isMobile(context) ? 3.5 : 3,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
        ),
        itemBuilder: (context, index) {
          final UserType type = UserType.values[index];
          return FutureBuilder(
            future: getUserFunction(type),
            builder: (context, snapshot) {
              return CustomTopViewContainer(
                onTap: () => context.read<DashBoardSelectedTypeBloc>().add(
                      ChangeType(
                        userType: UserType.values[index],
                      ),
                    ),
                child: Center(
                  child: Text(
                    "${typeName(type)} - ${snapshot.data?.length ?? 0}",
                    style: const TextStyle(
                      fontSize: 23,
                    ),
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
