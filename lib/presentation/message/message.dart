import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/message/widgets/show_users_list_widget.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      width: double.infinity,
      child: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          width: Responsive.getWidthRatio(
            mobile: 400,
            tablet: 700,
            desktop: 850,
            context: context,
          ),
          child: Row(
            children: [
              const ShowUsersChatWidget(),
              if(!Responsive.isMobile(context))
              const VerticalDivider(),
              if(!Responsive.isMobile(context))
              Expanded(
                flex: 8,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

