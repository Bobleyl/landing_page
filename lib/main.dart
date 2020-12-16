import 'package:flutter/material.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

import 'views/blog_page.dart';
import 'views/contact_page.dart';
import 'views/course_page.dart';
import 'views/home_page.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String route = '/home';
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/backdrop.png"), context);
    return MaterialApp(
      title: 'Bleyl Dev',
      theme: ThemeData(
        bottomAppBarColor: Color(0xff8c53ff),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => HomePage(),
              settings: settings,
            );

            break;
          case "/home":
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => HomePage(),
              settings: settings,
            );
            break;
          case "/blog":
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => BlogPage(),
              settings: settings,
            );
            break;
          case "/course":
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => CoursePage(),
              settings: settings,
            );
            break;
          case "/contact":
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => ContactPage(),
              settings: settings,
            );
            break;
          default:
            return PageRouteBuilder<dynamic>(
              pageBuilder: (_, __, ___) => HomePage(),
              settings: settings,
            );
        }
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
