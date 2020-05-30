import 'package:firebase_auth/firebase_auth.dart';
import 'package:smit/services/authentication.dart';
import 'package:smit/services/users.dart';
import 'custom_widgets.dart';
import 'package:flutter/material.dart';

class Custom_Drawer extends StatelessWidget {
  final UserData user;
  final AuthService _auth = AuthService();

  Custom_Drawer({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: Container(
            color: myblue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 20.0),
                  child: Text(
                    "Hello ${user.name.split(' ')[0]}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Divider(
                  thickness: 3.0,
                  color: mylightyellow,
                ),
                Tiles(
                    "My Profile",
                    Icons.person,
                    () => {
                          Navigator.pop(context),
                          Navigator.pushNamed(context, '/profile')
                        }),
                Tiles(
                    "Chats",
                    Icons.chat,
                    () => {
                          Navigator.pop(context),
                          Navigator.pushNamed(context, '/chat_page')
                        }),
                Tiles(
                    "Search People",
                    Icons.search,
                    () => {
                          Navigator.pop(context),
                          Navigator.pushNamed(context, '/search')
                        }),
                Tiles("Add Event", Icons.playlist_add, () => null),
                Tiles("My Events", Icons.event, () => null),
                Tiles("Sign Out", Icons.remove_circle_outline, () async {
                  await _auth.signout();
                  Navigator.pushReplacementNamed(context, '/');
                })
              ],
            )));
  }
}

Widget Tiles(String value, IconData ic, Function action) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
    child: Container(
      color: Colors.white38,
      child: ListTile(
        onTap: action,
        dense: true,
        leading: Icon(
          ic,
          color: mylightyellow,
          size: 40.0,
        ),
        title: Text(
          value,
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
    ),
  );
}
