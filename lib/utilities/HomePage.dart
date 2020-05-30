import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smit/services/authentication.dart';
import 'package:smit/services/user_database.dart';
import 'package:smit/services/users.dart';
import 'navdrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class HomeWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamProvider<UserData>.value(
      value: DatabaseService(uid: user.uid).userdata,
      child: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> currevents = [
      'images/landscape.jpg',
      'images/landscape2.png',
      'images/landscape3.png'
    ];
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);
    final userdata = Provider.of<UserData>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: myblue,
          title: Image.asset(
            "images/white_logo.png",
            height: 60.0,
            width: 70.0,
          ),
        ),
        drawer: Custom_Drawer(
          user: userdata,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: currevents.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0)
                        ],
                        image: DecorationImage(
                            image: AssetImage(currevents[index]),
                            fit: BoxFit.cover)),
                  ),
                );
              },
              options: CarouselOptions(
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  scrollDirection: Axis.horizontal,
                  autoPlayInterval: Duration(seconds: 6),
                  enlargeCenterPage: false),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0),
              child: Text(
                "Upcoming Events",
                style: TextStyle(
                    fontSize: 25.0,
                    color: myOrange,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: _screenwidth * 0.65),
              child: Container(
                height: 3.0,
                color: myOrange,
              ),
            ),
            Container(
              height: 185.0,
              child: ListView(
                padding: EdgeInsets.all(5.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CustomCard(
                    name: "TEDxSMIT",
                    imagepath: 'images/landscape3.png',
                    dat: '19.04.2020',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
