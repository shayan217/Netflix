class Top250Modle {
  List<Movies250>? movies250;
  Top250Modle({this.movies250, required Movies250 movie});
  Top250Modle.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies250 = <Movies250>[];
      json['movies'].forEach((v) {
        movies250!.add(new Movies250.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies250 != null) {
      data['movies'] = this.movies250!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Movies250 {
  String? image;
  String? title;
  String? year;
  String? timeline;
  String? imdbRating;
  String? link;
  Movies250(
      {this.image,
      this.title,
      this.year,
      this.timeline,
      this.imdbRating,
      this.link});
  Movies250.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    year = json['year'];
    timeline = json['timeline'];
    imdbRating = json['imdbRating'];
    link = json['link'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['year'] = this.year;
    data['timeline'] = this.timeline;
    data['imdbRating'] = this.imdbRating;
    data['link'] = this.link;
    return data;
  }
}