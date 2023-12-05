import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/user_details/user_details.dart';
import 'package:flutter/material.dart';

class SingleUserScreen extends StatelessWidget {
  const SingleUserScreen({
    super.key,
    required this.user,
  });
  final QueryDocumentSnapshot user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(
                            10,
                          ),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            user['profile_pic'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    child: Image.network(
                      user['profile_pic'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          UserProfileDetailsTile(
            title: 'Username',
            subtitle: user['username'],
          ),
          StreamBuilder(
            stream: UserDetails(userId: user.id).getAllCourseInProgress(),
            builder: (context, snapshot) {
              final List<String> courses = [];
              if (snapshot.data != null) {
                for (var corse in snapshot.data!.docs) {
                  courses.add(corse.id);
                }
              }
              return UserProfileDetailsTile(
                title: 'Coures Taken',
                subtitle: courses.join('\n'),
              );
            },
          ),
          UserProfileDetailsTile(
            title: 'Username',
            subtitle: user['username'],
          ),
        ],
      ),
    );
  }
}

class UserProfileDetailsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const UserProfileDetailsTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          const Text("   -   "),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
