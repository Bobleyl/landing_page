import 'package:bleyldev_website/views/widgets/explore_drawer.dart';
import 'package:bleyldev_website/views/widgets/social_info.dart';
import 'package:bleyldev_website/views/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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

class HomeInfo extends StatefulWidget {
  HomeInfo({Key key}) : super(key: key);

  @override
  _HomeInfoState createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'yjJJxYn94S4',
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 0),
      showControls: true,
      autoPlay: false,
      showFullscreenButton: true,
    ),
  );
  YoutubePlayerController _controller2 = YoutubePlayerController(
    initialVideoId: 'At2A4MoIz6U',
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 0),
      showControls: true,
      autoPlay: false,
      showFullscreenButton: true,
    ),
  );
  YoutubePlayerController _controller3 = YoutubePlayerController(
    initialVideoId: 'R9B6DxVriwc',
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 0),
      showControls: true,
      autoPlay: false,
      showFullscreenButton: true,
    ),
  );

  // ignore: must_call_super
  void dispose() {
    _controller.close();
    _controller2.close();
    _controller3.close();
  }

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

    return ResponsiveWidget(
      largeScreen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileData,
        ],
      ),
      smallScreen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileDataSmall,
        ],
      ),
    );
  }
}
