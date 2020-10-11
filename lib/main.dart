import 'package:bleyldev_website/views/posts/flutter_developer_article.dart';
import 'package:flutter/material.dart';

import 'views/about_page.dart';
import 'views/blog_page.dart';
import 'views/contact_page.dart';
import 'views/course_page.dart';
import 'views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String route = '/home';
  @override
  Widget build(BuildContext context) {
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
        '/FlutterDeveloperArticle': (context) => FlutterDeveloperArticle(),
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
