import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsForAdmin {
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static final CollectionReference<Map<String, dynamic>> _user =
      _instance.collection('users');

  static Future<List<QueryDocumentSnapshot<Object?>>> getAllUsers() async {
    return (await _user.get()).docs;
  }

  static Future<void> deleteUser(String username, String userid) async {
    await _user.doc(userid).delete();
    await _instance.collection('usernames').doc(username).delete();
  }

  static Future<void> changeAccess({
    bool isAdmin = false,
    bool isTutor = false,
    required String userId,
  }) async {
    _user.doc(userId).update({
      'isAdmin': isAdmin,
      'isTutor': isTutor,
    });
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getAllStudents() async {
    final QuerySnapshot users = await _user.get();
    List<QueryDocumentSnapshot<Object?>> list = [];
    for (var user in users.docs) {
      if (!user['isAdmin'] && !user['isTutor']) {
        list.add(user);
      }
    }
    return list;
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getAllAdmin() async {
    final QuerySnapshot users = await _user.get();
    List<QueryDocumentSnapshot<Object?>> list = [];
    for (var user in users.docs) {
      if (user['isAdmin']) {
        list.add(user);
      }
    }
    return list;
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getAllTutor() async {
    final QuerySnapshot users = await _user.get();
    List<QueryDocumentSnapshot<Object?>> list = [];
    for (var user in users.docs) {
      if (user['isTutor']) {
        list.add(user);
      }
    }
    return list;
  }
}
