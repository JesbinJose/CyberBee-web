import 'package:cyberbee_web/application/type_check.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class ShowUserInfoWidget extends StatelessWidget {
  final double width;
  const ShowUserInfoWidget({
    super.key,
    required this.width,
    required this.type,
  });
  final UserType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      width: width,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        color: Colors.white.withOpacity(0.1),
      ),
      child: FutureBuilder(
          future: getUserFunction(type),
          builder: (context, snapshot) {
            if (snapshot.data == null) return const SizedBox();
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final user = snapshot.data?[index];
                return ListTile(
                  title: Text(user?['username']),
                  subtitle: Text(user?.id ?? ''),
                  leading: Container(
                    padding: const EdgeInsets.all(2),
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: primaryColor,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Image.network(
                        user?['profile_pic'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
