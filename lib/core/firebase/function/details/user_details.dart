import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsForAdmin {
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static final CollectionReference<Map<String, dynamic>> _user =
      _instance.collection('users');

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return _user.where('username', isNotEqualTo: null).snapshots();
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

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllStudents() {
    return _user
        .where('isAdmin', isEqualTo: false)
        .where('isTutor', isEqualTo: false)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllAdmin() {
    return _user.where('isAdmin', isEqualTo: true).snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllTutor() {
    return _user.where('isTutor', isEqualTo: true).snapshots();
  }
}
