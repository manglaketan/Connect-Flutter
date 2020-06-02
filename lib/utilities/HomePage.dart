import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smit/services/authentication.dart';
import 'package:smit/services/user_database.dart';
import 'package:smit/services/users.dart';
import 'navdrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';
import '../services/events.dart';

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
    List<Event> currevents = [
      Event(
          eventId: "1",
          eventname: "Techno Hiring",
          date: "11.07.2019",
          poster: "images/event2.png"),
      Event(
          eventId: "2",
          eventname: "Music Night",
          date: "10.08.2019",
          poster: "images/event3.jpg"),
      Event(
          eventId: "3",
          eventname: "Booked Up",
          date: "22.07.2019",
          poster: "images/event4.jpg"),
      Event(
          eventId: "4",
          eventname: "Vocal Idol",
          date: "30.07.2019",
          poster: "images/event6.jpeg")
    ];

    List<Event> pastevents = [
      Event(
          eventId: "1",
          eventname: "Alum Connect",
          date: "13.05.2019",
          poster: "images/event7.jpeg"),
      Event(
          eventId: "2",
          eventname: "Video Worksh..",
          date: "16.06.2019",
          poster: "images/event8.jpeg"),
      Event(
          eventId: "3",
          eventname: "Hack It",
          date: "09.04.2019",
          poster: "images/event 11.jpeg"),
      Event(
          eventId: "4",
          eventname: "Comedy Night",
          date: "30.07.2019",
          poster: "images/event 10.jpeg")
    ];
    List<String> carouselevents = [
      'images/event2.png',
      'images/event3.jpg',
      'images/event4.jpg',
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
              itemCount: carouselevents.length,
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
                            image: AssetImage(carouselevents[index]),
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
              child: ListView.separated(
                itemCount: currevents.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    name: currevents[index].eventname,
                    dat: currevents[index].date,
                    action: ()=>print(currevents[index].eventname),
                    imagepath: currevents[index].poster,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 10.0,

                ),
                padding: EdgeInsets.all(5.0),
                scrollDirection: Axis.horizontal,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0),
              child: Text(
                "Past Events",
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
              child: ListView.separated(
                itemCount: pastevents.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    name: pastevents[index].eventname,
                    dat: pastevents[index].date,
                    imagepath: pastevents[index].poster,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 10.0,

                ),
                padding: EdgeInsets.all(5.0),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ));
  }
}
