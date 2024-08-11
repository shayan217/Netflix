class MoviesNewsModel {
  List<News>? news;
  MoviesNewsModel({this.news});
  MoviesNewsModel.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(new News.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class News {
  String? image;
  String? title;
  String? description;
  String? date;
  String? writer;
  String? source;
  String? link;
  News(
      {this.image,
      this.title,
      this.description,
      this.date,
      this.writer,
      this.source,
      this.link});
  News.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    writer = json['writer'];
    source = json['source'];
    link = json['link'];
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