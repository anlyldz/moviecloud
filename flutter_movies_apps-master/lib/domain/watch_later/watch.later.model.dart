import 'dart:convert';

class WatchLaterModel {
  List<WatchLaterResults>? results;

  WatchLaterModel({this.results});

  WatchLaterModel.from(Map<String, dynamic> json) {
    //print('data : ${json['results']}');
    if (json['results'] != null) {
      results = <WatchLaterResults>[];
      json['results'].forEach((v) {
        print('data $v');
         results!.add(WatchLaterResults.from(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WatchLaterResults {
  int? id;
  String? title;
  String? overview;
  bool? isMovie;
  String? posterPath;
  double? rating;

  WatchLaterResults(
      {this.id,
      this.title,
      this.overview,
      this.isMovie,
      this.posterPath,
      this.rating});

  WatchLaterResults.from(Map<String, dynamic> json) {

    posterPath = json['poster_path'];
    title = json['title'];
    overview = json['overview'];
    id = json['id'];
    isMovie = json['is_movie'];
    rating = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['poster_path'] = posterPath;
    data['title'] = title;
    data['overview'] = overview;
    data['rating'] = rating;
    data['is_movie'] = isMovie;

    return data;
  }
}
