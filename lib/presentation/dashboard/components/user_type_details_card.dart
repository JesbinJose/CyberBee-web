import 'package:flutter/material.dart';

import '../../../constants.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key? key,
    required this.type,
    required this.number,
    required this.color,
  }) : super(key: key);
  final String type;
  final int number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: primaryColor.withOpacity(0.15),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            color: color,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "$number People",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            number.toString(),
          ),
        ],
      ),
    );
  }
}
