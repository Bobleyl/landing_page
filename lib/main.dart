import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bleyl Dev',
      theme: ThemeData(
        bottomAppBarColor: Color(0xff8c53ff),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
