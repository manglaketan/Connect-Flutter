import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smit/services/events_database.dart';
import 'package:smit/services/users.dart';
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
    final user = Provider.of<User>(context);
    widget._tempevent = Event(eventId: '1');
    double _screenheight = MediaQuery.of(context).size.height;
    double _screenwidth = MediaQuery.of(context).size.width;

    setcursor(_elink, widget._tempevent.regnlink);
    setcursor(_ename, widget._tempevent.eventname);
    setcursor(_edate, widget._tempevent.date);
    setcursor(_edesc, widget._tempevent.description);
    setcursor(_ephon, joinlist(widget._tempevent.org_contact.keys.toList()));
    setcursor(_eorga, joinlist(widget._tempevent.org_contact.values.toList()));

    Event _setUpdatedEvent() {
      Event eve = Event(
          eventId: widget._tempevent.eventId,
          eventname: _ename.text,
          description: _ename.text,
          date: _edate.text,
          owner: user.uid,
          org_contact:
              mapping(_ephon.text.split('\n'), _eorga.text.split('\n')),
          regnlink: _elink.text);
      return eve;
    }

    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            FlatButton(
              shape: CircleBorder(),
              onPressed: () async {
                await EventDatabase(eventid: widget._tempevent.eventId)
                    .updateUserData(_setUpdatedEvent());
                Navigator.pushReplacementNamed(context, '/home');
              },
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
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/event9.jpeg'),fit: BoxFit.cover),
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

  Map<String, String> mapping(List<String> phone, List<String> names) {
    Map<String, String> temp = Map();
    for (var i = 0; i < phone.length; i++) temp[phone[i]] = names[i];
    return temp;
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
