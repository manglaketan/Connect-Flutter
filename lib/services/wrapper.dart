import 'package:smit/services/user_database.dart';
import 'package:smit/utilities/HomePage.dart';
import 'users.dart';
import '../utilities/initial_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null)
      return Login();
    else
      return HomeWrap();
  }
}
