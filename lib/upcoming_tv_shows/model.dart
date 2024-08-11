class TVShowModel {
  List<TVShowItem>? items;
  TVShowModel({this.items});
  TVShowModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      items = <TVShowItem>[];
      json['list'].forEach((v) {
        items!.add(TVShowItem.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['list'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class TVShowItem {
  String? date;
  List<ShowDetails>? shows;
  TVShowItem({this.date, this.shows});
  TVShowItem.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['list'] != null) {
      shows = <ShowDetails>[];
      json['list'].forEach((v) {
        shows!.add(ShowDetails.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (shows != null) {
      data['list'] = shows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class ShowDetails {
  String? image;
  String? title;
  List<String>? categories;
  List<String>? staring;
  String? link;
  ShowDetails({this.image, this.title, this.categories, this.staring, this.link});
  ShowDetails.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    categories = json['categories']?.cast<String>();
    staring = json['staring']?.cast<String>();
    link = json['link'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['categories'] = categories;
    data['staring'] = staring;
    data['link'] = link;
    return data;
  }
}