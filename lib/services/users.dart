import 'package:flutter/cupertino.dart';

class User {
  String email;
  String uid;

  User({this.email, this.uid});
}

class UserData {
  String RegNo;
  String name, description;
  List<String> hobbies;
  List<String> skills;
  List<String> achievements; //List of String values for each
  List<int> participation; //List of event IDs for the events participated
  String profileImage;
  String uid;
  String phone;

  UserData(
      {this.RegNo = "",
      this.name = "",
      this.skills = const [""],
      this.description = "",
      this.achievements = const [""],
      this.hobbies = const [""],
      this.participation = const [],
      this.profileImage,
      this.phone = "",
      this.uid});
}
