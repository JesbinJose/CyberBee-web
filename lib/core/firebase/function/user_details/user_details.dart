import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  //need to add userId manually in the on going work todo
  UserDetails({required String userId}) {
    _user = _instance.collection('users').doc(userId);
  }
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  late DocumentReference<Map<String, dynamic>> _user;

  Future<String> getUsername() async {
    return (await _user.get()).data()?['username'] ?? '';
  }

  Future<bool> isadmin() async {
    return (await _user.get()).data()?['isAdmin'] ?? false;
  }

  //User Courses
  Future<List> getAllCourseInProgress() async {
    final r = await _user.get();
    return r.data()!['courses'] as List;
  }

  Future<double> getProgress() async {
    return (await _user.collection('courses_in_progress').get()).docs.length /
        (await _instance.collection('courses').get()).docs.length;
  }

  Stream<QuerySnapshot> getAllCertificate() {
    return _user.collection("certificates").snapshots();
  }

  Future<void> addProfilePic(String path) async {
    _user.update({'profile_pic': path});
  }

  Future<String> getProfilePicLink() async {
    return (await _user.get()).data()!['profile_pic'];
  }

  Future<void> sendPersonalNotification(String message, String url) async {
    _user.update(
      {
        'notification': FieldValue.arrayUnion(
          [
            {'message': message, 'url': url}
          ],
        ),
      },
    );
  }
}
