import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../util/my_flutter_app_icons.dart' as CustomIcons;

import '../util/responsive_widget.dart';
import '../util/web_scrollbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _isHovering = [false, false, false, false];
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Container(
          color: Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Image.asset(
                    "assets/logo_appbar.png",
                    height: 50,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[0] = true
                                : _isHovering[0] = false;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'About',
                              style: TextStyle(
                                fontSize: 20,
                                color: _isHovering[0]
                                    ? Colors.blue[200]
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[0],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width / 20),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[1] = true
                                : _isHovering[1] = false;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Blog',
                              style: TextStyle(
                                fontSize: 20,
                                color: _isHovering[1]
                                    ? Colors.blue[200]
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[1],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width / 20),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[2] = true
                                : _isHovering[2] = false;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Courses',
                              style: TextStyle(
                                fontSize: 20,
                                color: _isHovering[2]
                                    ? Colors.blue[200]
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[2],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width / 20),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[3] = true
                                : _isHovering[3] = false;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Contact',
                              style: TextStyle(
                                fontSize: 20,
                                color: _isHovering[3]
                                    ? Colors.blue[200]
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[3],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width / 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              HomeInfo(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              SocialInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeInfo extends StatelessWidget {
  const HomeInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final profileData = Stack(
      children: [
        Container(
          child: SizedBox(
            height: screenSize.height * 0.65,
            width: screenSize.width,
            child: Image.asset(
              'assets/cover.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );

    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileData],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[profileData],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(
        color: color,
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class SocialInfo extends StatelessWidget {
  List<Widget> socialMediaWidgets() {
    return [
      IconButton(
        icon: Icon(
          CustomIcons.MyFlutterApp.github_squared,
          color: Color(0xff8c53ff),
        ),
        onPressed: () {
          html.window.open("https://github.com/Bobleyl", "Github");
        },
      ),
      IconButton(
        icon: Icon(
          CustomIcons.MyFlutterApp.twitter_squared,
          color: Color(0xff8c53ff),
        ),
        onPressed: () {
          html.window.open("https://twitter.com/bleyldev", "Twitter");
        },
      ),
      IconButton(
        icon: Icon(
          CustomIcons.MyFlutterApp.youtube_squared,
          color: Color(0xff8c53ff),
        ),
        onPressed: () {
          html.window.open("https://www.youtube.com/c/BleylDev", "Youtube");
        },
      ),
      IconButton(
        icon: Icon(
          CustomIcons.MyFlutterApp.medium,
          color: Color(0xff8c53ff),
        ),
        onPressed: () {
          html.window.open("https://medium.com/@bleyldev", "Medium");
        },
      ),
    ];
  }

  Widget copyRightText() => Padding(
        padding: EdgeInsets.only(
          right: 20,
        ),
        child: Text(
          "Bleyl Dev ©️2020",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}
