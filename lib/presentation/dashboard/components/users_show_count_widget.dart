import 'package:cyberbee_web/application/type_check.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class ShowUserCount extends StatelessWidget {
  const ShowUserCount({
    super.key,
    required this.type,
  });
  final UserType type;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: secondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            typeName(type),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              defaultPadding,
            ),
            child: Text(
              '-',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          FutureBuilder(
            future: getUserFunction(type),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              } else {
                return Text(
                  snapshot.data?.length.toString() ?? '0',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 30,
                      ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}