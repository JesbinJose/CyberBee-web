
import 'package:cyberbee_web/application/type_check.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

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
