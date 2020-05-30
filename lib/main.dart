import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smit/services/authentication.dart';
import 'package:smit/services/pagerouter.dart';
import 'package:smit/services/users.dart';
import 'package:smit/services/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: "Connect",
        home: Wrapper(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
