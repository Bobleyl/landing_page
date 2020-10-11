import 'package:bleyldev_website/views/widgets/social_info.dart';
import 'package:flutter/material.dart';

import '../util/responsive_widget.dart';
import '../util/web_scrollbar.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
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
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 7.0,
                              vertical: 5.0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'About',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: _isHovering[0]
                                        ? Colors.blue
                                        : Colors.black,
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
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
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
                                color:
                                    _isHovering[1] ? Colors.blue : Colors.black,
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
                                color: Colors.black,
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
                                color:
                                    _isHovering[2] ? Colors.blue : Colors.black,
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
                                color: Colors.black,
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
                                color:
                                    _isHovering[3] ? Colors.blue : Colors.black,
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
                                color: Colors.black,
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

class AboutInfo extends StatelessWidget {
  const AboutInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final profileData = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: screenSize.height / 10),
        Row(
          children: [
            Text(
              "Hi, I'm ",
              style: TextStyle(fontSize: 32),
            ),
            Text(
              "Bo!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
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
              image: NetworkImage('/assets/profile.jpg'),
            ),
          ),
        ),
        SizedBox(height: screenSize.height / 50),
        Text(
          """          About Me: My name is Bo, I’m a Software Engineer and a Teacher of 
          Flutter.  I manage a youtube channel called Bleyl Dev that teaches 
          Developers how to better their Flutter skills.  I’ve spent the last 8 
          years coding as well as teaching kids and adults alike how to code.
      
          My long-term hope is that Bleyl Dev can grow to provide
          free Flutter help to all!  In addition to my current Youtube videos I'm 
          working on, I'm currently working on \"Flutter Jr\", a Flutter coding 
          course that teaches kids how to code with Flutter and Dart.  If you want 
          to get to know me more or need help with a Flutter project, please be 
          sure to join our discord!  Connect with other developers and get quick 
          Flutter help when you need it.  Link is in footer at bottom of webpage 😉
          """,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: screenSize.height / 10),
        Row(
          children: [
            Text(
              "About ",
              style: TextStyle(fontSize: 32),
            ),
            Text(
              "Bleyl Dev",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: screenSize.height / 50),
        Text(
          """        Bleyl Dev is a channel devoted to teaching Flutter.  Our goal is to 
        provide weekly, quality flutter content.  If you aren't already subscribed
        to the channel, be sure to do so now!  If you have any topics that you 
        are struggling with and would like to see a video on it on our channel,
        please reach out via our \'Contact\' page and let us know!
        
        Interested in being a part of the Bleyl Dev team? If you enjoy
        teaching others and have a knack for video editing, we'd love to look at
        your content and potentially post a video of yours on the channel.  Just 
        reach out and let us know you're interested.  

        Want to contribute and help others?  Join our discord or reach out to 
        potentially be a moderator and help out with handling Flutter and Dart
        related questions from the community.
        """,
          style: TextStyle(fontSize: 20),
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