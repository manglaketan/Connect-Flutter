import 'package:cloud_firestore/cloud_firestore.dart';
import 'events.dart';

class EventDatabase {
  final CollectionReference eventref = Firestore.instance.collection('events');
  final eventid;

  EventDatabase({this.eventid});

  Future updateUserData(Event _tempuser) async {
    print("Updating");
    return await eventref.document(eventid).setData({
      'eventid':_tempuser.eventId,
      'name': _tempuser.eventname,
      "link": _tempuser.regnlink,
      "description": _tempuser.description,
      "date": _tempuser.date,
      "owner": _tempuser.owner,
      "organizers": _tempuser.org_contact
    });
  }

  List<Event> _userlistfromsnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Event(
        eventId: eventid,
        description: doc.data['description'],
        eventname: doc.data['name'],
        regnlink: doc.data['link'],
        org_contact: doc.data['organizers'],
        date: doc.data['date'],
        owner: doc.data['owner'],
      );
    }).toList();
  }

  Event _userdatafromsnapshot(DocumentSnapshot doc) {
    return Event(
      eventId: eventid,
      description: doc.data['description'],
      eventname: doc.data['name'],
      date: doc.data['date'],
      org_contact: doc.data['organizers'],
      regnlink: doc.data['link'],
      owner: doc.data['owner'],
    );
  }

  Stream<Event> get eventdata {
//    print('In getter function:');
    try {
      return eventref.document(eventid).snapshots().map(_userdatafromsnapshot);
    } catch (e) {
      print("In catch: " + e.toString());
      return null;
    }
  }

  Stream<List<Event>> get events {
    return eventref.snapshots().map(_userlistfromsnapshot);
  }
}
