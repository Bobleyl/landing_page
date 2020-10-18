import 'package:bleyldev_website/views/widgets/explore_drawer.dart';
import 'package:bleyldev_website/views/widgets/social_info.dart';
import 'package:bleyldev_website/views/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
        width: screenSize.width / 1.4,
        child: HtmlWidget(
          htmlString,
          textStyle: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 20,
          ),
          customWidgetBuilder: (element) {
            if (element.localName == "img") {
              return Center(child: Image.network(element.attributes['src']));
            }

            return null;
          },
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
