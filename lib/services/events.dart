import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Event {
  String eventId;
  String eventname, description;
  String poster;
  String date;
  Map<String, String> org_contact;
  String owner;
  String regnlink;

  Event(
      {@required this.eventId,
      this.description = '',
      this.date = '',
      this.eventname = '',
      this.org_contact = const {'': ''},
      this.owner = '',
      this.regnlink = '',
      this.poster});
}
