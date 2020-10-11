import 'package:bleyldev_website/views/widgets/explore_drawer.dart';
import 'package:bleyldev_website/views/widgets/social_info.dart';
import 'package:bleyldev_website/views/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/responsive_widget.dart';

class FlutterDeveloperArticle extends StatefulWidget {
  FlutterDeveloperArticle({Key key}) : super(key: key);

  @override
  _FlutterDeveloperArticleState createState() =>
      _FlutterDeveloperArticleState();
}

class _FlutterDeveloperArticleState extends State<FlutterDeveloperArticle> {
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
            BlogInfo(),
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

class BlogInfo extends StatelessWidget {
  const BlogInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final profileData = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: screenSize.width / 1.5,
          child: Column(
            children: [
              SizedBox(height: screenSize.height / 6),
              Text(
                "What does a Flutter Developer Look Like in 2020?",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 55.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "I’m always fascinated by trends and patterns in the industry and what they can tell us about where things are heading in the near future. I came across a neat infographic for Java developers highlighting the statistics of the industry and what made a Java developer in 2020 and wanted to do the same for Flutter! Here is my Flutter 2020 graphic of what makes a Flutter Developer! Please feel free to save the infographic and use it however you’d like.",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Image.network(
                  'https://miro.medium.com/max/1400/1*vf_MidTWVahlez0h27E8bQ.png'),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Salary Note: The above-mentioned average is for US developers. For a more detailed report on salaries across the world see this link. I cannot verify the accuracy however of the reported salaries found in that study, only the US number.",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Most popular packages among Flutter Developers:",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                """   • http: https://pub.dev/packages/http
   • shared_preferences: https://pub.dev/packages/shared_preferences
   • provider: https://pub.dev/packages/provider
   • rxdart: https://pub.dev/packages/rxdart
   • cached_network_image: https://pub.dev/packages/cached_network_image
   • animations: https://pub.dev/packages/animations""",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Countries using Flutter the most (the study bundled European Union into a single entity for results):",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    """      • India
       • China
       • United States
       • EU
       • Brazil""",
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );

    final profileDataSmall = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: screenSize.width / 1.5,
          child: Column(
            children: [
              SizedBox(height: screenSize.height / 6),
              Text(
                "What does a Flutter Developer Look Like in 2020?",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 55.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "I’m always fascinated by trends and patterns in the industry and what they can tell us about where things are heading in the near future. I came across a neat infographic for Java developers highlighting the statistics of the industry and what made a Java developer in 2020 and wanted to do the same for Flutter! Here is my Flutter 2020 graphic of what makes a Flutter Developer! Please feel free to save the infographic and use it however you’d like.",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Image.network(
                  'https://miro.medium.com/max/1400/1*vf_MidTWVahlez0h27E8bQ.png'),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Salary Note: The above-mentioned average is for US developers. For a more detailed report on salaries across the world see this link. I cannot verify the accuracy however of the reported salaries found in that study, only the US number.",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Most popular packages among Flutter Developers:",
                  style: GoogleFonts.lato(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  """   • http: https://pub.dev/packages/http
   • shared_preferences: https://pub.dev/packages/shared_preferences
   • provider: https://pub.dev/packages/provider
   • rxdart: https://pub.dev/packages/rxdart
   • cached_network_image: https://pub.dev/packages/cached_network_image
   • animations: https://pub.dev/packages/animations""",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Countries using Flutter the most (the study bundled European Union into a single entity for results):",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    """      • India
       • China
       • United States
       • EU
       • Brazil""",
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              )
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
