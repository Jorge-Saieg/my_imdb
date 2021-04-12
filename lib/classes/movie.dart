// import 'package:my_imdb/services/get_popular.dart';

class Movie {
  final String title;
  final String description;
  final String topImg;
  final String mainImg;
  final int relaseDate;
  final int rate;
  final List<String> genere;

  const Movie({
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
      title: json['title'],
      description: json['overview'],
      topImg: json['backdrop_path'],
      mainImg: json['poster_path'],
      relaseDate: json['release_date'],
      rate: json['vote_average'],
      genere: List<String>.from(json['genre_ids']),
    );
  }
}

// Future<List<Movie>> popularMovies = getPopular();
