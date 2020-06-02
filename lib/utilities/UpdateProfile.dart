import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smit/services/user_database.dart';
import 'package:smit/services/users.dart';
import 'custom_widgets.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';

class Update_Profile extends StatefulWidget {
  UserData tempuser;

  Update_Profile({Key key, this.tempuser}) : super(key: key);

  @override
  _Update_ProfileState createState() => _Update_ProfileState();
}

class _Update_ProfileState extends State<Update_Profile> {
  File _image;
  String _uploadedfileURL;

  TextEditingController _registration = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _hobbies = TextEditingController();
  TextEditingController _skills = TextEditingController();
  TextEditingController _achievements = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future chooseFile() async {
      await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
        setState(() {
          _image = image;
        });
      });
    }

    Future uploadFile() async {
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('profileimages/${Path.basename(_image.path)}}');
      StorageUploadTask uploadTask = storageReference.putFile(_image);
      await uploadTask.onComplete;
      print('File Uploaded');
      String url = await storageReference.getDownloadURL();
      setState(() {
        _uploadedfileURL = url;
      });
//      storageReference.getDownloadURL().then((fileURL) {
//        setState(() {
//          _uploadedfileURL = fileURL;
//          print(_uploadedfileURL);
//        });
//      });
    }

    setcursor(_registration, widget.tempuser.RegNo);
    setcursor(_name, widget.tempuser.name);
    setcursor(_phone, widget.tempuser.phone);
    setcursor(_description, widget.tempuser.description);
    setcursor(_skills, joinlist(widget.tempuser.skills));
    setcursor(_achievements, joinlist(widget.tempuser.achievements));
    setcursor(_hobbies, joinlist(widget.tempuser.hobbies));

    return StreamProvider<UserData>.value(
      value: DatabaseService().userdata,
      child: Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              FlatButton(
                shape: CircleBorder(),
                onPressed: () async {
                  final user = Provider.of<User>(context, listen: false);
                  await uploadFile();
                  await DatabaseService(uid: user.uid)
                      .updateUserData(_setupdatedUser());
                  Navigator.pushNamed(context, '/home');
                },
                splashColor: Colors.white24,
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
            backgroundColor: myblue,
            title: Text(
              "Update Your Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  letterSpacing: 0.7,
                  fontWeight: FontWeight.w700),
            )),
        body: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    "Profile Photo",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40.0),
                    onTap: chooseFile,
                    child: CircleAvatar(
                      backgroundColor: myOrange,
                      backgroundImage:
                          _image != null ? AssetImage(_image.path) : null,
                      radius: 50.0,
                      child: _image == null
                          ? Text(
                              "Upload       Image",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )
                          : Text(""),
                    ),
                  ),
                ),
              ),
              UpdateTextField(
                controller: _registration,
                labeltext: "Registration Number",
                keyboardType: TextInputType.number,
              ),
              UpdateTextField(
                controller: _name,
                labeltext: "Name",
              ),
              UpdateTextField(
                controller: _phone,
                labeltext: "Phone Number",
                keyboardType: TextInputType.phone,
              ),
              UpdateTextField(
                controller: _description,
                labeltext: "Description",
                maxlines: null,
              ),
              UpdateTextField(
                controller: _hobbies,
                labeltext: "Hobbies",
                maxlines: null,
              ),
              UpdateTextField(
                controller: _skills,
                labeltext: "Skills",
                maxlines: null,
              ),
              UpdateTextField(
                controller: _achievements,
                labeltext: "Achievements",
                maxlines: null,
              )
            ],
          ),
        ),
      ),
    );
  }

  void setcursor(TextEditingController val, String set) {
    val.text = set;
    val.selection =
        TextSelection.fromPosition(TextPosition(offset: val.text.length));
  }

  String joinlist(List<String> vals) {
    String ans = "";
    if (vals.length == 1) return ans;
    for (var a in vals) {
      print(a);
      ans += a;
      ans += "\n";
    }
    return ans;
  }

  UserData _setupdatedUser() {
    return UserData(
        hobbies: _hobbies.text.split('\n'),
        profileImage: _uploadedfileURL,
        achievements: _achievements.text.split('\n'),
        name: _name.text,
        phone: _phone.text,
        RegNo: _registration.text,
        skills: _skills.text.split('\n'),
        description: _description.text);
  }
}
