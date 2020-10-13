class Posts {
  final String title;
  final String seo;
  final String html;
  final String img;

  const Posts({
    this.title,
    this.seo,
    this.html,
    this.img,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      title: json['title'],
      seo: json['seo'],
      html: json['html'],
      img: json['img'],
    );
  }
}
