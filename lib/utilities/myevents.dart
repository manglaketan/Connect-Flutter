import 'package:flutter/material.dart';
import '../services/events.dart';
import 'custom_widgets.dart';

class MyEvents extends StatelessWidget {
  List<Event> events = [
    Event(
        eventId: "1",
        eventname: "PUBg League",
        date: "22.12.2019",
        poster: "images/event9.jpeg"),
    Event(
        eventId: "2",
        eventname: "Video Worksh..",
        date: "16.06.2019",
        poster: "images/event8.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: myblue,
          title: Text(
            "Your Events",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                letterSpacing: 0.7,
                fontWeight: FontWeight.w700),
          )),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 200.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomCard(
                    name: events[0].eventname,
                    dat: events[0].date,
                    imagepath: events[0].poster,
                  ),
                  CustomCard(
                    name: events[1].eventname,
                    dat: events[1].date,
                    imagepath: events[1].poster,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
