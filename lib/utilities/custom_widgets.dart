import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

final Color myOrange = Color(0xFFF77F00);
final Color myyellow = Color(0xFFFFAD00);
final Color myblue = Color(0xFF003049);
final Color mybluelight = Color(0xCC003049);
final Color mygreen = Color(0xFF00916E);
final Color mylightyellow = Color.fromRGBO(252, 196, 78, 1);

TextStyle smallTextStyle(Color col) {
  return TextStyle(fontFamily: "Lato", color: col, fontWeight: FontWeight.w700);
}

TextStyle largeTextStyle() {
  return TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: 35.0,
      color: myOrange);
}

/////////////////////////////////////////////////////////////////////////
//CUSTOM TEXT FIELD
////////////////////////////////////////////////////////////////////////
class customtextfield extends StatefulWidget {
  @override
  final String text;
  final controller;
  final bool obscure;
  Function validator = () => null;
  TextInputType kbtype = TextInputType.text;

  customtextfield(
      {Key key,
      this.text,
      this.controller,
      this.obscure,
      this.kbtype,
      this.validator})
      : super(key: key);

  @override
  _customtextfieldState createState() => _customtextfieldState();
}

class _customtextfieldState extends State<customtextfield> {
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0, bottom: 0.0),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.kbtype,
        obscureText: (widget.obscure == null) ? false : widget.obscure,
//        onChanged: onchanged,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 17.0,
            fontWeight: FontWeight.w700,
            color: myblue),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 11.0),
            hintText: "${widget.text}",
            hintStyle: TextStyle(
              fontFamily: "Lato",
              fontWeight: FontWeight.w700,
              color: myyellow,
              fontSize: 17.0,
            ),
            errorStyle: TextStyle(
              fontFamily: "Lato",
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.redAccent, width: 2.0)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.redAccent, width: 2.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: myOrange, width: 2.0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: myOrange, width: 2.0))),
        cursorColor: myblue,
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////
//BACKGROUND FOR INITIAL PAGES
////////////////////////////////////////////////////////////////////////
class Initial_Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                child: Image.asset(
                  "images/bottom.png",
                  fit: BoxFit.fill,
                ),
                height: 250.0,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                child: Image.asset(
                  "images/top.png",
                  fit: BoxFit.fill,
                ),
                height: 250.0,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                child: Opacity(
                  opacity: 0.75,
                  child: Image.asset(
                    "images/cutlogo.png",
                    fit: BoxFit.fill,
                  ),
                ),
                height: 250.0,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

/////////////////////////////////////////////////////////////////////////
//CUSTOM BUTTON
////////////////////////////////////////////////////////////////////////
class CustomButton extends StatefulWidget {
  final String text;
  final Color color;
  final VoidCallback callback;
  Color textcolor = Colors.white;

  CustomButton({Key key, this.text, this.color, this.callback, this.textcolor})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.0),
        color: widget.color,
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(2.0, 2.0), blurRadius: 5.0, color: Colors.black26)
        ],
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            bottomRight: const Radius.circular(10.0)),
      ),
      child: FlatButton(
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.black12,
        onPressed: widget.callback,
        child: Text(
          "${widget.text}",
          style: TextStyle(
              fontFamily: "Poppins",
              color: widget.textcolor,
              fontSize: 20.0,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
//Background For Setting Password Page
//////////////////////////////////////////////////////////////

class Password_Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                child: Image.asset(
                  "images/password_down.png",
                  fit: BoxFit.fill,
                ),
                height: 250.0,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                child: Image.asset(
                  "images/password_top.png",
                  fit: BoxFit.fill,
                ),
                height: 210.0,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                child: Opacity(
                  opacity: 0.75,
                  child: Image.asset(
                    "images/cutlogo.png",
                    fit: BoxFit.fill,
                  ),
                ),
                height: 250.0,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

/*
CUSTOM CARD FOR HOMEPAGE
 */

class CustomCard extends StatelessWidget {
  final String name, dat, imagepath;
  final Function action;

  const CustomCard({Key key, this.name, this.dat, this.imagepath, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        width: 175.0,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 1.0),
            image: DecorationImage(
              image: AssetImage(imagepath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(5.0),
                bottomRight: const Radius.circular(5.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2.5, 2.5),
                  blurRadius: 3.0),
            ]),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: 55.0,
                  decoration: BoxDecoration(
                      color: myblue,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(5.0))),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 23.0,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          dat,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
FILTER TILE
 */

class FilterTile extends StatelessWidget {
  @override
  final String text;

  const FilterTile({Key key, this.text}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 5.0),
      child: Container(
        padding: EdgeInsets.all(6.0),
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text(
            text,
            style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 17.0),
          ),
          Icon(
            Icons.cancel,
            color: Colors.white,
            size: 20.0,
          )
        ]),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: mygreen),
      ),
    );
  }
}

class Search_Item extends StatelessWidget {
  final String name, imagepath, description;
  final Function action;

  const Search_Item({Key key, this.name, this.imagepath, this.description, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        onTap: action,
        title: Text(
          name,
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: myblue,
              fontSize: 17.0),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
              fontFamily: "Lato",
              fontWeight: FontWeight.w500,
              color: mygreen,
              fontSize: 15.0),
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imagepath),
          radius: 27.0,
        ),
      ),
    );
  }
}

/*
Update Text Fields
 */

class UpdateTextField extends StatefulWidget {
  @override
  TextInputType keyboardType = TextInputType.text;
  String labeltext;
  Function validator;
  int maxlines = 1;
  TextEditingController controller;

  UpdateTextField(
      {Key key,
      @required this.labeltext,
      this.keyboardType,
      this.validator,
      this.maxlines,
      this.controller})
      : super(key: key);

  _UpdateTextFieldState createState() => _UpdateTextFieldState();
}

class _UpdateTextFieldState extends State<UpdateTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxlines,
        validator: widget.validator,
        style: TextStyle(fontFamily: "Lato", fontSize: 19.0),
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.redAccent, fontFamily: "Lato"),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: myblue, width: 2.0)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue[700], width: 2.0)),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 2.0)),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 2.0)),
            labelText: widget.labeltext,
            labelStyle:
                TextStyle(color: myblue, fontFamily: "Lato", fontSize: 20.0)),
        cursorColor: myblue,
      ),
    );
  }
}

/*
Default User Profile Picture
 */
class DefaultProfilePhoto extends StatelessWidget {
  final size;

  const DefaultProfilePhoto({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: myOrange,
      child: Icon(
        Icons.person,
        size: size * 1.3,
        color: Colors.white,
      ),
    );
  }
}

/*
For Chat Message
 */
class Message extends StatelessWidget {
  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
            me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 14.0,
                fontWeight: FontWeight.w700),
          ),
          Material(
            color: me ? mygreen : mybluelight,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              width: (text.length > 40)
                  ? MediaQuery.of(context).size.width * 0.8
                  : null,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
