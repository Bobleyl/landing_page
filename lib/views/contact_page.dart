import 'package:bleyldev_website/views/widgets/explore_drawer.dart';
import 'package:bleyldev_website/views/widgets/social_info.dart';
import 'package:bleyldev_website/views/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/responsive_widget.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../util/my_flutter_app_icons.dart' as CustomIcons;

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: ExploreDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/backdrop.png"),
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              ContactInfo(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              SocialInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final profileData = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: screenSize.height / 8),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff8c53ff),
                borderRadius: BorderRadius.circular(15.0),
              ),
              height: 325,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Flutter Help",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "FREE",
                        style: GoogleFonts.lato(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Have a question you",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "need help with?",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 250,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        html.window.open(
                          "mailto:bleyldev@gmail.com",
                          "Email",
                        );
                      },
                      child: Center(
                        child: Text(
                          "Contact Now",
                          style: GoogleFonts.lato(
                            fontSize: 24.0,
                            color: Color(0xff8c53ff),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15.0),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff8c53ff),
                borderRadius: BorderRadius.circular(15.0),
              ),
              height: 325,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Flutter Consulting",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$35",
                        style: GoogleFonts.lato(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "  / Hour",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        " - Dedicated Project Help",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        " - Help Building Features",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 250,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        html.window.open(
                          "mailto:bleyldev@gmail.com",
                          "Email",
                        );
                      },
                      child: Center(
                        child: Text(
                          "Contact Now",
                          style: GoogleFonts.lato(
                            fontSize: 24.0,
                            color: Color(0xff8c53ff),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: screenSize.height / 10),
        Text(
          "Other ways to get in touch",
          style: GoogleFonts.lato(
            fontSize: 36,
            color: Colors.white,
          ),
        ),
        SizedBox(height: screenSize.height / 20),
        Row(
          children: [
            IconButton(
              iconSize: 100,
              icon: Icon(
                CustomIcons.MyFlutterApp.mail_squared,
                color: Colors.white,
              ),
              onPressed: () {
                html.window.open(
                  "mailto:bleyldev@gmail.com",
                  "Email",
                );
              },
            ),
            IconButton(
              iconSize: 100,
              icon: Icon(
                CustomIcons.MyFlutterApp.twitter_squared,
                color: Colors.white,
              ),
              onPressed: () {
                html.window.open(
                  "https://twitter.com/bleyldev",
                  "Twitter",
                );
              },
            ),
            IconButton(
              iconSize: 95,
              icon: Icon(
                CustomIcons.MyFlutterApp.discord,
                color: Colors.white,
              ),
              onPressed: () {
                html.window.open(
                  "https://discord.gg/aUQj87U",
                  "Discord",
                );
              },
            ),
          ],
        ),
      ],
    );

    final profileDataSmall = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: screenSize.height / 8),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff8c53ff),
                borderRadius: BorderRadius.circular(15.0),
              ),
              height: 350,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Flutter Help",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "FREE",
                        style: GoogleFonts.lato(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Have a question you",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "need help with?",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 250,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        html.window.open(
                          "mailto:bleyldev@gmail.com",
                          "Email",
                        );
                      },
                      child: Center(
                        child: Text(
                          "Contact Now",
                          style: GoogleFonts.lato(
                            fontSize: 24.0,
                            color: Color(0xff8c53ff),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff8c53ff),
                borderRadius: BorderRadius.circular(15.0),
              ),
              height: 350,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Flutter Consulting",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$35",
                        style: GoogleFonts.lato(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "  / Hour",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        " - Dedicated Project Help",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        " - Help Building Features",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 250,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        html.window.open(
                          "mailto:bleyldev@gmail.com",
                          "Email",
                        );
                      },
                      child: Center(
                        child: Text(
                          "Contact Now",
                          style: GoogleFonts.lato(
                            fontSize: 24.0,
                            color: Color(0xff8c53ff),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: screenSize.height / 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Other ways to get in touch",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 36,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: screenSize.height / 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 100,
              icon: Icon(
                CustomIcons.MyFlutterApp.mail_squared,
                color: Colors.white,
              ),
              onPressed: () {
                html.window.open(
                  "mailto:bleyldev@gmail.com",
                  "Email",
                );
              },
            ),
            IconButton(
              iconSize: 100,
              icon: Icon(
                CustomIcons.MyFlutterApp.twitter_squared,
                color: Colors.white,
              ),
              onPressed: () {
                html.window.open(
                  "https://twitter.com/bleyldev",
                  "Twitter",
                );
              },
            ),
            IconButton(
              iconSize: 95,
              icon: Icon(
                CustomIcons.MyFlutterApp.discord,
                color: Colors.white,
              ),
              onPressed: () {
                html.window.open(
                  "https://discord.gg/aUQj87U",
                  "Discord",
                );
              },
            ),
          ],
        ),
      ],
    );

    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileData,
        ],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileDataSmall,
        ],
      ),
    );
  }
}
