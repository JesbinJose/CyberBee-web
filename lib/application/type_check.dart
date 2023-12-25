import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/details/user_details.dart';

String typeName(UserType user) {
  switch (user) {
    case UserType.student:
      return "Student";
    case UserType.tutor:
      return "Tutor";
    case UserType.admin:
      return "Admin";
    default:
      return "Users";
  }
}

Stream<QuerySnapshot<Map<String, dynamic>>> getUserFunction(
    UserType type) {
  switch (type) {
    case UserType.student:
      return  UserDetailsForAdmin.getAllStudents();
    case UserType.tutor:
      return UserDetailsForAdmin.getAllTutor();
    case UserType.admin:
      return UserDetailsForAdmin.getAllAdmin();
    default:
      return UserDetailsForAdmin.getAllUsers();
  }
}