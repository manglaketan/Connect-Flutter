import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smit/services/loading.dart';
import 'package:smit/services/user_database.dart';
import 'package:smit/services/users.dart';
import 'custom_widgets.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData data = snapshot.data;
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: true,
                  backgroundColor: myblue,
                  title: Text(
                    "My Profile",
                    style: TextStyle(
                        letterSpacing: 0.8,
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700),
                  ),
                ),
                body: Stack(
                  children: <Widget>[
                    Container(
                      width: screenwidth,
                      height: screenheight * 0.3,
                      color: myblue,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, top: 3.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data.name,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color: mylightyellow,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w700),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                backgroundColor: myOrange,
                                backgroundImage: NetworkImage(
                                    data.profileImage
                                ),
                                radius: 60.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 14.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: FractionallySizedBox(
                                heightFactor: 0.8,
                                widthFactor: 0.65,
                                child: Text(
                                  data.description,
                                  style: TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 16.0,
                                      color: Colors.white),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: screenwidth,
                        height: screenheight * 0.588,
                        child: ListView(
                          children: <Widget>[
                            CustomRow(
                              title: "Hobbies",
                              items: data.hobbies,
                            ),
                            CustomRow(
                                title: "Achievements",
                                items: data.achievements),
                            CustomRow(
                              title: "Skills",
                              items: data.skills,
                            ),
                            CustomRow(
                              title: "Phone No.",
                              items: [data.phone],
                            ),
                            CustomRow(
                              title: "Email",
                              items: [user.email],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          } else {
            return Loading();
          }
        });
  }
}

TextStyle smallstyle(double size) {
  return TextStyle(
      fontFamily: "Lato",
      fontWeight: FontWeight.w700,
      fontSize: size,
      color: Colors.black);
}

class CustomRow extends StatelessWidget {
  final String title;
  final List<String> items;

  const CustomRow({Key key, this.title, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 10.0),
            child: Text(
              title,
              style: smallstyle(20.0),
            ),
          ),
        ),
        Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 45.0),
              child: ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Text(
                      "${items[index]}",
                      style: smallstyle(17.0),
                    );
                  }),
            ))
      ],
    );
  }
}
