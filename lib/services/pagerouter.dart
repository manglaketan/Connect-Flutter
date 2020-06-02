import 'package:smit/utilities/Chat_Page.dart';
import 'package:smit/utilities/myevents.dart';
import '../services/users.dart';
import 'package:flutter/material.dart';
import '../utilities/EventPage.dart';
import '../utilities/HomePage.dart';
import '../utilities/UpdateEvent.dart';
import '../utilities/SearchPage.dart';
import '../utilities/UpdateProfile.dart';
import '../utilities/initial_pages.dart';
import '../utilities/Profile.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/forgot_password':
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case '/set_password':
        return MaterialPageRoute(builder: (_) => SetPassword(email: args));
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeWrap());
      case '/search':
        return MaterialPageRoute(builder: (_) => Search_Page());
      case '/update_event':
        return MaterialPageRoute(builder: (_) => Update_Event());
      case '/update_profile':
        return MaterialPageRoute(
            builder: (_) => Update_Profile(
                  tempuser: args,
                ));
      case '/event_page':
        return MaterialPageRoute(builder: (_) => EventPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/chat_page':
        return MaterialPageRoute(builder: (_) => Chat());
      case '/my_events':
        return MaterialPageRoute(builder: (_)=> MyEvents());
    }
  }
}
