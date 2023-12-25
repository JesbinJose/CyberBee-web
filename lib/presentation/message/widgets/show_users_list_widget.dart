import 'package:cyberbee_web/core/firebase/function/details/user_details.dart';
import 'package:cyberbee_web/presentation/widgets/single_profile_view.dart';
import 'package:flutter/material.dart';

class ShowUsersChatWidget extends StatelessWidget {
  const ShowUsersChatWidget({
    super.key,
    required this.user,
  });
  final ValueNotifier<String?> user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: SizedBox(
        child: StreamBuilder(
          stream: UserDetailsForAdmin.getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final user = snapshot.data!.docs[index];
                  return Container(
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: const BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          this.user.value = user.id;
                        },
                        title: Text(user['username']),
                        leading: CircleProfileView(
                          profileUrl: user['profile_pic'],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
