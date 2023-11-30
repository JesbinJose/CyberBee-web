import 'package:cyberbee_web/application/bloc/dashboard/dash_board_selected_type_bloc.dart';
import 'package:cyberbee_web/application/type_check.dart';
import 'package:cyberbee_web/presentation/dashboard/components/show_user_part.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';

class SingleTypeShowDetails extends StatelessWidget {
  const SingleTypeShowDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: BlocBuilder<DashBoardSelectedTypeBloc, DashBoardSelectedTypeState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Text(
                  typeName(
                    state.userType,
                  ),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShowUserInfoWidget(
                          width: Responsive.isTablet(context) ? 350 : 400,
                        ),
                        if (!Responsive.isMobile(context))
                          ShowUserInfoWidget(
                            width: Responsive.isTablet(context) ? 350 : 400,
                          ),
                      ],
                    ),
                    if (Responsive.isMobile(context))
                      const SizedBox(height: defaultPadding),
                    if (Responsive.isMobile(context))
                      const ShowUserInfoWidget(
                        width: 400,
                      ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
