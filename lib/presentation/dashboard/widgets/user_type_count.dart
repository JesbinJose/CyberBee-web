
import 'package:cyberbee_web/application/bloc/dashboard/usercontrol/dash_board_selected_type_bloc.dart';
import 'package:cyberbee_web/application/type_check.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/widgets/custom_container_top_view.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
