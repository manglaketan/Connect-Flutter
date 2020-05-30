import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class Search_Page extends StatelessWidget {
  Widget build(BuildContext context) {
    double _screenheight = MediaQuery.of(context).size.height;
    double _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: myblue,
        title: Text(
          "Search Your People",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: _screenheight * 0.09,
        padding: EdgeInsets.only(left: 3.0, right: 3.0, top: 8.0),
        color: Color.fromRGBO(247, 127, 0, 0.4),
        child: TextField(
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: myblue,
              fontSize: 20.0),
          cursorColor: myblue,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: IconButton(
              icon: Icon(Icons.filter_list),
              iconSize: 30.0,
              color: myblue,
              onPressed: () => {print("Searching")},
            ),
            hintText: "Search Your Favorite People Here",
            hintStyle: TextStyle(
                color: Color.fromRGBO(0, 48, 73, 0.5),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
