class CelebretiesNewsModel {
  List<Newsof>? newsof;
  CelebretiesNewsModel({this.newsof});
  CelebretiesNewsModel.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      newsof = <Newsof>[];
      json['news'].forEach((v) {
        newsof!.add(new Newsof.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newsof != null) {
      data['news'] = this.newsof!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Newsof {
  String? image;
  String? title;
  String? description;
  String? date;
  String? writer;
  String? source;
  String? link;
  Newsof(
      {this.image,
      this.title,
      this.description,
      this.date,
      this.writer,
      this.source,
      this.link});
  Newsof.fromJson(Map<String, dynamic> json) {
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