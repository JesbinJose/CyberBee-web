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
      return "Total Users";
  }
}

Future<List<QueryDocumentSnapshot<Object?>>> getUserFunction(
    UserType type) async {
  switch (type) {
    case UserType.student:
      return await UserDetailsForAdmin.getAllStudents();
    case UserType.tutor:
      return await UserDetailsForAdmin.getAllTutor();
    case UserType.admin:
      return await UserDetailsForAdmin.getAllAdmin();
    default:
      return await UserDetailsForAdmin.getAllUsers();
  }
}