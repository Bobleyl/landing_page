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
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            HomeInfo(),
            SocialInfo(),
          ],
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
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.black),
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
                  "Join the Bleyl Dev Community!",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

    final profileDataSmall = Stack(
      children: [
        Container(
          child: SizedBox(
            width: screenSize.width,
            child: Image.asset(
              'assets/home_banner_tall.png',
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
        children: <Widget>[
          profileData,
          Container(
            height: 500,
          )
        ],
      ),
      smallScreen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileDataSmall,
          SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () {
              html.window.open(
                "https://www.youtube.com/c/BleylDev?sub_confirmation=1",
                "Youtube",
              );
            },
            child: Image.asset("assets/youtube_panel.png"),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
