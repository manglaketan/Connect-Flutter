import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smit/services/users.dart';

class DatabaseService {
  //Collection Reference
  final CollectionReference userref = Firestore.instance.collection('Users');
  final uid;

  DatabaseService({this.uid});

  Future updateUserData(UserData _tempuser) async {
    return await userref.document(uid).setData({
      'RegNo': _tempuser.RegNo,
      'name': _tempuser.name,
      "skills": _tempuser.skills,
      "description": _tempuser.description,
      "hobbies": _tempuser.hobbies,
      "achievements": _tempuser.achievements,
      "participation": _tempuser.participation,
      "phone": _tempuser.phone
    });
  }

  List<UserData> _userlistfromsnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserData(
          description: doc.data['description'],
          name: doc.data['name'],
          RegNo: doc.data['RegNo'],
          phone: doc.data['phone'],
          skills: doc.data['skills'],
          participation: doc.data['participation'],
          achievements: doc.data['achievements'],
          hobbies: doc.data['hobbies']);
    }).toList();
  }

  UserData _userdatafromsnapshot(DocumentSnapshot doc) {
    List<String> skills = [];
    List<String> achievements = [];
    List<String> hobbies = [];
    List<int> participation = [];
    for (var a in doc.data['skills']) skills.add(a);
    for (var a in doc.data['achievements']) achievements.add(a);
    for (var a in doc.data['hobbies']) hobbies.add(a);
    for (var a in doc.data['participation']) participation.add(a);
    return UserData(
        uid: uid,
        description: doc.data['description'],
        name: doc.data['name'],
        RegNo: doc.data['RegNo'],
        phone: doc.data['phone'],
        skills: skills,
        participation: participation,
        achievements: achievements,
        hobbies: hobbies);
  }

  Stream<UserData> get userdata {
//    print('In getter function:');
    try {
      return userref.document(uid).snapshots().map(_userdatafromsnapshot);
    } catch (e) {
      print("In catch: " + e.toString());
      return null;
    }
  }

  Stream<List<UserData>> get users {
    return userref.snapshots().map(_userlistfromsnapshot);
  }
}
