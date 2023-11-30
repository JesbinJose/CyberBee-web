import 'package:cyberbee_web/application/bloc/dashboard/dash_board_selected_type_bloc.dart';
import 'package:cyberbee_web/application/type_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';

class SingleTypeShowDetails extends StatelessWidget {
  const SingleTypeShowDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
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
              Text(
                typeName(
                  state.userType,
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  height: MediaQuery.sizeOf(context).height-300,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
