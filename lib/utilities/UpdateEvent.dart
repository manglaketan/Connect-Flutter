import 'package:flutter/material.dart';
import 'custom_widgets.dart';
import '../services/events.dart';

class Update_Event extends StatefulWidget {
  Event _tempevent;

  @override
  _Update_EventState createState() => _Update_EventState();
}

class _Update_EventState extends State<Update_Event> {
  String imagepath = 'images/landscape3.png';

  TextEditingController _ename = TextEditingController();
  TextEditingController _edesc = TextEditingController();
  TextEditingController _edate = TextEditingController();
  TextEditingController _eorga = TextEditingController();
  TextEditingController _ephon = TextEditingController();
  TextEditingController _elink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _screenheight = MediaQuery.of(context).size.height;
    double _screenwidth = MediaQuery.of(context).size.width;

    setcursor(_elink, widget._tempevent.regnlink);
    setcursor(_ename, widget._tempevent.eventname);
    setcursor(_edate, widget._tempevent.date);
    setcursor(_edesc, widget._tempevent.description);
    setcursor(_ephon, joinlist(widget._tempevent.org_contact.keys));
    setcursor(_eorga, joinlist(widget._tempevent.org_contact.values));

    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            FlatButton(
              shape: CircleBorder(),
              onPressed: () => print("Save Pressed"),
              splashColor: Colors.white24,
              child: Text(
                "Save",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
          backgroundColor: myblue,
          title: Text(
            "Update Your Event",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                letterSpacing: 0.7,
                fontWeight: FontWeight.w700),
          )),
      body: ListView(
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
          UpdateTextField(
            labeltext: "Event Name",
            controller: _ename,
          ),
          UpdateTextField(
            labeltext: "Event Description",
            maxlines: null,
            controller: _edesc,
          ),
          UpdateTextField(
            controller: _edate,
            labeltext: "Date (DD/MM/YYYY)",
          ),
          UpdateTextField(
            labeltext: "Organizers Name",
            maxlines: null,
            controller: _eorga,
          ),
          UpdateTextField(
            labeltext: "Organizers Contact",
            maxlines: null,
            controller: _ephon,
          ),
          UpdateTextField(
            labeltext: "Registration Link",
            maxlines: null,
            controller: _elink,
          ),
        ],
      ),
    );
  }

  void setcursor(TextEditingController val, String set) {
    val.text = set;
    val.selection =
        TextSelection.fromPosition(TextPosition(offset: val.text.length));
  }

  String joinlist(List<String> vals) {
    String ans = "";
    if (vals.length == 1) return ans;
    for (var a in vals) {
      print(a);
      ans += a;
      ans += "\n";
    }
    return ans;
  }
}
