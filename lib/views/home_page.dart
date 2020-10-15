import 'package:bleyldev_website/views/widgets/explore_drawer.dart';
import 'package:bleyldev_website/views/widgets/social_info.dart';
import 'package:bleyldev_website/views/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/responsive_widget.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              HomeInfo(),
              SocialInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeInfo extends StatefulWidget {
  HomeInfo({Key key}) : super(key: key);

  @override
  _HomeInfoState createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final profileData = Stack(
      children: [
        Container(
          color: Color(0xff8c53ff),
          child: SizedBox(
            width: screenSize.width,
            child: Image.asset(
              'assets/home_banner_tall.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 75,
          bottom: 150,
          child: Container(
            height: 85,
            decoration: BoxDecoration(
              color: Color(0xff8c53ff),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: MaterialButton(
              onPressed: () {
                html.window.open(
                  "https://www.youtube.com/c/BleylDev?sub_confirmation=1",
                  "Youtube",
                );
              },
              child: Center(
                child: Text(
                  "Subscribe Now!",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 45,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

    final profileData2 = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: screenSize.height / 10),
        Container(
          decoration: BoxDecoration(
            color: Color(0xff8c53ff),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              SizedBox(height: screenSize.height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hi, I'm ",
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Bo!",
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height / 50),
              Container(
                width: 250.0,
                height: 250.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://www.bobleyl.com/assets/img/profile.jpg'),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height / 50),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  """          About Me: My name is Bo, I’m a Software Engineer and a Teacher of 
          Flutter.  I manage a youtube channel called Bleyl Dev that teaches 
          Developers how to better their Flutter skills.  I’ve spent the last 8 
          years coding as well as teaching kids and adults alike how to code.
      
          My long-term hope is that Bleyl Dev can grow to provide free Flutter 
          help to all!  In addition to my current Youtube videos I'm working 
          on, I'm currently working on \"Flutter Jr\", a Flutter coding course 
          that teaches kids how to code with Flutter and Dart.  If you want to 
          get to know me more or need help with a Flutter project, please be sure 
          to join our discord!  Connect with other developers and get quick Flutter 
          help when you need it.  Link is in footer at bottom of webpage 😉
          """,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenSize.height / 10),
        Container(
          decoration: BoxDecoration(
            color: Color(0xff8c53ff),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              SizedBox(height: screenSize.height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "About ",
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Bleyl Dev",
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height / 50),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  """        Bleyl Dev is a channel devoted to teaching Flutter.  Our goal is to 
        provide weekly, quality flutter content.  If you aren't already subscribed
        to the channel, be sure to do so now!  If you have any topics that you 
        are struggling with and would like to see a video on it on our channel,
        please reach out via our \'Contact\' page and let us know!
        
        Interested in being a part of the Bleyl Dev team? If you enjoy teaching 
        others and have a knack for video editing, we'd love to look at your 
        content and potentially post a video of yours on the channel.  Just 
        reach out and let us know you're interested.  

        Want to contribute and help others?  Join our discord or reach out to 
        potentially be a moderator and help out with handling Flutter and Dart
        related questions from the community.
        """,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final profileDataSmall = Stack(
      children: [
        Container(
          child: SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: Image.asset(
              'assets/home_banner_tall.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );

    final profileDataSmall2 = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: screenSize.height / 10),
        Container(
          width: screenSize.width / 1.2,
          decoration: BoxDecoration(
            color: Color(0xff8c53ff),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              SizedBox(height: screenSize.height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hi, I'm ",
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Bo!",
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height / 50),
              Container(
                width: 250.0,
                height: 250.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://www.bobleyl.com/assets/img/profile.jpg'),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height / 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "About Me: My name is Bo, I’m a Software Engineer and a Teacher of Flutter. I manage a youtube channel called Bleyl Dev that teaches Developers how to better their Flutter skills. I’ve spent the last 8 years coding as well as teaching kids and adults alike how to code.",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                ),
                child: Text(
                  "My long-term hope is that Bleyl Dev can grow to provide free Flutter help to all! In addition to my current Youtube videos I'm working on, I'm currently working on \"Flutter Jr\", a Flutter coding course that teaches kids how to code with Flutter and Dart. If you want to get to know me more or need help with a Flutter project, please be sure to join our discord! Connect with other developers and get quick Flutter help when you need it. Link is in footer at bottom of webpage 🙂\n",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height / 50),
            ],
          ),
        ),
        SizedBox(height: screenSize.height / 10),
        Container(
          width: screenSize.width / 1.2,
          decoration: BoxDecoration(
            color: Color(0xff8c53ff),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              SizedBox(height: screenSize.height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "About ",
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Bleyl Dev",
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height / 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Bleyl Dev is a channel devoted to teaching Flutter. Our goal is to provide weekly, quality flutter content. If you aren't already subscribed to the channel, be sure to do so now! If you have any topics that you are struggling with and would like to see a video on it on our channel, please reach out via our \'Contact\' page and let us know!",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                ),
                child: Text(
                  "Interested in being a part of the Bleyl Dev team? If you enjoy teaching others and have a knack for video editing, we'd love to look at your content and potentially post a video of yours on the channel. Just reach out and let us know you're interested.",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                ),
                child: Text(
                  "Want to contribute and help others? Join our discord or reach out to potentially be a moderator and help out with handling Flutter and Dart related questions from the community.",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height / 50),
            ],
          ),
        ),
      ],
    );

    return ResponsiveWidget(
      largeScreen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileData,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width / 5),
            child: profileData2,
          ),
          SizedBox(height: screenSize.height / 20),
        ],
      ),
      smallScreen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileDataSmall,
          profileDataSmall2,
          SizedBox(height: screenSize.height / 20),
        ],
      ),
    );
  }
}
