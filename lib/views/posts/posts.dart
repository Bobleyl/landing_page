class Posts {
  final String title;
  final String seo;
  final String html;

  const Posts({
    this.title,
    this.seo,
    this.html,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      title: json['title'],
      seo: json['seo'],
      html: json['html'],
    );
  }
}
