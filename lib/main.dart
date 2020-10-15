import 'package:flutter/material.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

import 'views/about_page.dart';
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
      initialRoute: '/',
      routes: {
        '/home': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/blog': (context) => BlogPage(),
        '/course': (context) => CoursePage(),
        '/contact': (context) => ContactPage(),
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
