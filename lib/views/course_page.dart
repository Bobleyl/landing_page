import 'package:bleyldev_website/views/widgets/explore_drawer.dart';
import 'package:bleyldev_website/views/widgets/social_info.dart';
import 'package:bleyldev_website/views/widgets/top_bar_contents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/responsive_widget.dart';

class CoursePage extends StatefulWidget {
  CoursePage({Key key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
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
      backgroundColor: Color(0xff543199),
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
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            AboutInfo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SocialInfo(),
          ],
        ),
      ),
    );
  }
}

class AboutInfo extends StatefulWidget {
  AboutInfo({Key key}) : super(key: key);

  @override
  _AboutInfoState createState() => _AboutInfoState();
}

class _AboutInfoState extends State<AboutInfo> {
  TextEditingController emailController = TextEditingController();
  bool submittedEmail = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final profileData = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: screenSize.height / 7),
        Container(
          decoration: BoxDecoration(
            color: Color(0xff8c53ff),
            borderRadius: BorderRadius.circular(15.0),
          ),
          height: screenSize.height / 1.7,
          width: 400,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/flutter_logo.png",
                        height: 60,
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        "Flutter Jr",
                        style: GoogleFonts.lato(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Learn Coding for Free!",
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You will learn:",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          " - Basic Dart & Flutter                 ",
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        " - Programming fundamentals",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        " - Build real apps!                            ",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        " - Suitable for ages 11+                ",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65.0),
                    child: TextFormField(
                      controller: emailController,
                      cursorColor: Colors.white,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        labelText: "Email",
                        labelStyle: GoogleFonts.lato(
                          color: Colors.white,
                        ),
                        hintText: "something@email.com",
                        hintStyle: GoogleFonts.lato(
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        await Firebase.initializeApp();
                        FirebaseFirestore.instance
                            .collection('Emails')
                            .doc(emailController.text)
                            .set({});
                        emailController.text = "";
                        setState(() {
                          submittedEmail = true;
                        });
                        Future.delayed(const Duration(milliseconds: 5000), () {
                          setState(() {
                            submittedEmail = false;
                          });
                        });
                      },
                      child: Center(
                        child: Text(
                          "Join Waitlist!",
                          style: GoogleFonts.lato(
                            fontSize: 24.0,
                            color: Color(0xff8c53ff),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (submittedEmail)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        "Thank you! We will email you when course is available.",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Color(0xff00CD00),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffb20000),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "COMING SOON!",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
