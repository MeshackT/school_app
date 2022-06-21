import 'package:firebase_auth/firebase_auth.dart';

class UserModel {

  String? uid;
  String? email;
  String? password;
  String? name;
  String? subjectTeaching;
  String? grade;

  UserModel({
    this.uid,
    this.email,
    this.password,
    this.name,
    this.grade,
    this.subjectTeaching,
  });

//getting data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
    );
  }

// Map<String, dynamic> userModel = {};

//sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'grade': grade,
      'name': name,
      'subjectTeaching': subjectTeaching,
    };
  }


}
