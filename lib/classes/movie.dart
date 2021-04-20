// import 'package:my_imdb/services/get_popular.dart';

class Movie {
  final int id;
  final String title;
  final String description;
  final String topImg;
  final String mainImg;
  final String relaseDate;
  final String rate;
  final List<int> genere;

  Movie({
    this.id,
    this.title,
    this.description,
    this.topImg,
    this.mainImg,
    this.relaseDate,
    this.rate,
    this.genere,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      description: json['overview'],
      topImg: json['backdrop_path'],
      mainImg: json['poster_path'],
      relaseDate: json['release_date'],
      rate: json['vote_average'] as String,
      genere: List<int>.from(json['genre_ids']),
    );
  }
}
