import 'custom_widgets.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  int eventId;
  String name = "TEDxSMIT";
  var description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed bibendum est. Nunc id neque a tortor varius placerat eu et nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam et sodales tellus. Suspendisse vitae posuere lectus, eget interdum justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris varius mattis porttitor. Fusce mi arcu, venenatis a nibh non, maximus dictum diam. Pellentesque ultrices at dolor eu fringilla. Nam scelerisque sagittis nibh, ut finibus tortor lacinia sed.";

  @override
  Widget build(BuildContext context) {
    Map organizers = {
      "9001002341": "Aman Jaiswal",
      "8977651432": "Kishan Kr. Ram",
      "7882777182": "Ketan Mangla"
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
              decoration: BoxDecoration(color: mygreen, boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(0, 4),
                    color: Colors.black26,
                    blurRadius: 4.0)
              ]),
              height: _screenheight * 0.35,
              width: _screenwidth,
              child: Center(
                child: Text(
                  "It Will Contain Event Poster",
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
