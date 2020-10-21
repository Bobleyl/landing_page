import 'package:bleyldev_website/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/responsive_widget.dart';

class BlogArticle extends StatefulWidget {
  BlogArticle(this.htmlString);

  final String htmlString;

  @override
  _BlogArticleState createState() => _BlogArticleState(htmlString);
}

class _BlogArticleState extends State<BlogArticle> {
  _BlogArticleState(this.htmlString);
  String htmlString;
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
              BlogInfo(htmlString),
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

class BlogInfo extends StatelessWidget {
  const BlogInfo(this.htmlString);

  final String htmlString;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final profileData = Padding(
      padding: EdgeInsets.only(
        top: 100,
      ),
      child: Container(
        color: Colors.black,
        width: screenSize.width / 1.4,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Html(
            data: htmlString,
            style: {
              "p": Style(
                fontFamily: GoogleFonts.lato().fontFamily,
                color: Colors.white,
                fontSize: FontSize.xLarge,
              ),
              "code": Style(
                fontFamily: GoogleFonts.lato().fontFamily,
                color: Colors.white,
                backgroundColor: Colors.white.withOpacity(.1),
              ),
              "h1": Style(
                fontFamily: GoogleFonts.lato().fontFamily,
                color: Colors.white,
                textAlign: TextAlign.center,
                fontSize: FontSize.xxLarge,
              ),
              "h2": Style(
                fontFamily: GoogleFonts.lato().fontFamily,
                color: Colors.white,
                textAlign: TextAlign.center,
                fontSize: FontSize.xxLarge,
              ),
            },
          ),
        ),
      ),
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
