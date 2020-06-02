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
                          Navigator.pushNamed(context, '/profile',
                              arguments: user)
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
                Tiles(
                    "Add Event",
                    Icons.playlist_add,
                    () => {
                          Navigator.pop(context),
                          Navigator.pushNamed(context, '/update_event')
                        }),
                Tiles(
                    "My Events",
                    Icons.event,
                    () => {
                          Navigator.pop(context),
                          Navigator.pushNamed(context, '/my_events')
                        }),
                Tiles("Sign Out", Icons.remove_circle_outline, () async {
//                  _showDialog();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(12.0),
                        backgroundColor: myblue,
                        title: new Text(
                          "Are You Sure?",
                          style: TextStyle(
                              color: mylightyellow,
                              fontSize: 25.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700),
                        ),
                        content: new Text(
                          "${user.name.split(' ')[0]}, you will be signed out of Connect!",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700),
                        ),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text(
                              "Yes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () async {
                              await _auth.signout();
                              Navigator.pushReplacementNamed(context, '/');
                            },
                          ),
                          new FlatButton(
                            child: new Text(
                              "No",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
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
