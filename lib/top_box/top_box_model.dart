class TopBoxModel {
  List<TopBoxMovies>? topboxmovies;

  TopBoxModel({this.topboxmovies});

  TopBoxModel.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      topboxmovies = <TopBoxMovies>[];
      json['movies'].forEach((v) {
        topboxmovies!.add(new TopBoxMovies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topboxmovies != null) {
      data['movies'] = this.topboxmovies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopBoxMovies {
  String? image;
  String? title;
  String? weekendGross;
  String? totalGross;
  String? weeksReleased;
  String? link;
  String? imdbRating;

  TopBoxMovies(
      {this.image,
      this.title,
      this.weekendGross,
      this.totalGross,
      this.weeksReleased,
      this.link,
      this.imdbRating});

  TopBoxMovies.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    weekendGross = json['weekendGross'];
    totalGross = json['totalGross'];
    weeksReleased = json['weeksReleased'];
    link = json['link'];
    imdbRating = json['imdbRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['weekendGross'] = this.weekendGross;
    data['totalGross'] = this.totalGross;
    data['weeksReleased'] = this.weeksReleased;
    data['link'] = this.link;
    data['imdbRating'] = this.imdbRating;
    return data;
  }
}