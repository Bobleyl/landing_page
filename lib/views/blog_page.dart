import 'package:bleyldev_website/views/posts/firebase_blog.dart';
import 'package:bleyldev_website/views/posts/posts.dart';
import 'package:bleyldev_website/views/widgets/explore_drawer.dart';
import 'package:bleyldev_website/views/widgets/social_info.dart';
import 'package:bleyldev_website/views/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/responsive_widget.dart';
import 'posts/blog_article.dart';

class BlogPage extends StatefulWidget {
  BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
              BlogInfo(),
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

class BlogInfo extends StatefulWidget {
  BlogInfo({Key key}) : super(key: key);

  @override
  _BlogInfoState createState() => _BlogInfoState();
}

class _BlogInfoState extends State<BlogInfo> {
  List<Posts> posts = [
    Posts(
        title: "",
        seo: "",
        html: "",
        img:
            "https://cdn.hashnode.com/res/hashnode/image/upload/v1598905085810/fy4TP6tWj.png")
  ];
  @override
  // ignore: must_call_super
  void initState() {
    getPost();
  }

  getPost() async {
    posts = await getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final profileData = Container(
      width: screenSize.width,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: .85,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(
          posts.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(10.0) +
                  EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(posts[index].img),
                    fit: BoxFit.fitHeight,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.darken,
                    ),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              posts[index].title,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 35,
                                background: Paint()
                                  ..color = Colors.black.withOpacity(.1),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          thickness: 3,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              posts[index].seo,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 20,
                                background: Paint()
                                  ..color = Colors.black.withOpacity(.1),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: screenSize.width / 6,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: MaterialButton(
                          hoverColor: Colors.black.withOpacity(.2),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BlogArticle(posts[index].html),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              "Read Now",
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
              ),
            );
          },
        ),
      ),
    );

    final profileDataSmall = ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Card(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(posts[index].img),
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          posts[index].title,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 35,
                            background: Paint()
                              ..color = Colors.black.withOpacity(.1),
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      thickness: 3,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          posts[index].seo,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            background: Paint()
                              ..color = Colors.black.withOpacity(.1),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenSize.width / 2,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BlogArticle(posts[index].html),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          "Read Now",
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
          ),
        ),
      ),
      itemCount: posts.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
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
        children: <Widget>[profileDataSmall],
      ),
    );
  }
}
