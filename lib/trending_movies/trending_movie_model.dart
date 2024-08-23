class TrendingMoviesModel {
  List<TrendingMoviesSecond>? trendingmovies;
  TrendingMoviesModel({this.trendingmovies});
  TrendingMoviesModel.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      trendingmovies = <TrendingMoviesSecond>[];
      json['movies'].forEach((v) {
        trendingmovies!.add(new TrendingMoviesSecond.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trendingmovies != null) {
      data['movies'] = this.trendingmovies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class TrendingMoviesSecond {
  String? image;
  String? title;
  String? year;
  String? timeline;
  String? imdbRating;
  String? link;
  TrendingMoviesSecond(
      {this.image,
      this.title,
      this.year,
      this.timeline,
      this.imdbRating,
      this.link});
  TrendingMoviesSecond.fromJson(Map<String, dynamic> json) {
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