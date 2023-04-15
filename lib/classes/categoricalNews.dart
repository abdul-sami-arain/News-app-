class News {
   String? title;
   String? descr;
   String? imageUrl;

  News({required this.title, required this.descr, required this.imageUrl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      descr: json['description'],
      imageUrl: json['urlToImage'],
    );
  }
}
