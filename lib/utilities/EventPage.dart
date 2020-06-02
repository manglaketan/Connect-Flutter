import 'custom_widgets.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  int eventId;
  String name = "PUBg League";
  var description =
      "Organized by Espenial, the gaming club of the college, this event aims to bring out the gamers and test their skills against the best players in the college. The prizes shall be as follows:\n1st: 5000/-\n2nd: 3000/-\n3rd: 1000/-";

  @override
  Widget build(BuildContext context) {
    Map organizers = {
      "8827939999": "Ramayan Rajesh",
      "8829900011": "Keerthi Manju",
      "9278939173": "Rohit Ranjan"
    };
    double _screenheight = MediaQuery.of(context).size.height;
    double _screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: myblue,
          title: Text(
            "Know $name",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                letterSpacing: 0.7,
                fontWeight: FontWeight.w700),
          )),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/event9.jpeg'),
                      fit: BoxFit.cover),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.black26,
                        blurRadius: 4.0)
                  ]),
              height: _screenheight * 0.35,
              width: _screenwidth,
              child: Center(
                child: Text(
                  "",
                  style: smallTextStyle(Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5.0),
            child: Text(
              "About $name",
              style: TextStyle(
                  fontSize: 25.0,
                  color: myblue,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: _screenwidth * 0.65),
            child: Container(
              height: 3.0,
              color: myblue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5.0),
            child: Text(
              "Date",
              style: TextStyle(
                  fontSize: 25.0,
                  color: myblue,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: _screenwidth * 0.65),
            child: Container(
              height: 3.0,
              color: myblue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "22 December 2019",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5.0),
            child: Text(
              "Contact Organizers",
              style: TextStyle(
                  fontSize: 25.0,
                  color: myblue,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: _screenwidth * 0.65),
            child: Container(
              height: 3.0,
              color: myblue,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (var items in organizers.keys)
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 8.0),
                  child: Row(children: <Widget>[
                    InkWell(
                      radius: 24.0,
                      onTap: () => {print("Call $items")},
                      child: Icon(
                        Icons.phone,
                        color: myblue,
                        size: 30.0,
                      ),
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Text(
                      "${organizers[items]} ($items)",
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ]),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 120.0, right: 120.0, bottom: 10.0, top: 10.0),
            child: CustomButton(
              text: "Participate",
              textcolor: myblue,
              color: mylightyellow,
              callback: () => {print("Participating")},
            ),
          )
        ],
      ),
    );
  }
}
