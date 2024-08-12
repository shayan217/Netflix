class MoviesNewsAdvance {
  List<NewsMovieAdvance>? newsmovieadvance;
  MoviesNewsAdvance({this.newsmovieadvance});
  MoviesNewsAdvance.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      newsmovieadvance = <NewsMovieAdvance>[];
      json['news'].forEach((v) {
        newsmovieadvance!.add(new NewsMovieAdvance.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newsmovieadvance != null) {
      data['news'] = this.newsmovieadvance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class NewsMovieAdvance {
  String? image;
  String? title;
  String? description;
  String? date;
  String? writer;
  String? source;
  String? link;
  NewsMovieAdvance({
    this.image,
    this.title,
    this.description,
    this.date,
    this.writer,
    this.source,
    this.link,
  });
  NewsMovieAdvance.fromJson(Map<String, dynamic> json) {
    image = json['image'] is String ? json['image'] : null;
    title = json['title'] is String ? json['title'] : null;
    description = json['description'] is String ? json['description'] : null;
    date = json['date'] is String ? json['date'] : null;
    writer = json['writer'] is String ? json['writer'] : null;
    source = json['source'] is String ? json['source'] : null;
    link = json['link'] is String ? json['link'] : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    data['writer'] = this.writer;
    data['source'] = this.source;
    data['link'] = this.link;
    return data;
  }
}