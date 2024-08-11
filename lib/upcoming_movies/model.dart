class MovieModel {
  List<Movies>? movies;

  MovieModel({this.movies});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.movies != null) {
      data['movies'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  String? date;
  List<MovieItem>? list;

  Movies({this.date, this.list});

  Movies.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['list'] != null) {
      list = <MovieItem>[];
      json['list'].forEach((v) {
        list!.add(MovieItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['date'] = this.date;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieItem {
  String? title;
  String? image;
  List<String>? categories;
  List<String>? staring;
  String? link;

  MovieItem({this.title, this.image, this.categories, this.staring, this.link});

  MovieItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    categories = json['categories'].cast<String>();
    staring = json['staring'].cast<String>();
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = this.title;
    data['image'] = this.image;
    data['categories'] = this.categories;
    data['staring'] = this.staring;
    data['link'] = this.link;
    return data;
  }
}
