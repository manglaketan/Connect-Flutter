import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class Profile extends StatelessWidget {
  String name = "Rohan Joshi";
  String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis volutpat nibh ut ipsum imperdiet, a dapibus velit mollis. Suspendisse congue dictum tellus mollis";
  Map information = {
    'Birth Date': '22/01/1992',
    'Achievements': ["Hello", "Going Places", "Dolor sem biet num ja ki ta"],
    'Hobbies': ['Dancing', "Singing"]
  };

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
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
                    padding: const EdgeInsets.only(left: 18.0, top: 3.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
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
                        radius: 60.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 14.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FractionallySizedBox(
                        heightFactor: 0.8,
                        widthFactor: 0.65,
                        child: Text(
                          description,
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
              ),
            )
          ],
        ));
  }
}
