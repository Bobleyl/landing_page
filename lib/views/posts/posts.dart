class Posts {
  final String title;
  final String seo;
  final String html;
  final String img;
  final String url;

  const Posts({
    this.title,
    this.seo,
    this.html,
    this.img,
    this.url,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      title: json['title'],
      seo: json['seo'],
      html: json['html'],
      img: json['img'],
      url: json['url'],
    );
  }
}
