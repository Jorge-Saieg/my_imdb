class Movie {
  final int id;
  final String title;
  final String description;
  final String topImg;
  final String mainImg;
  final String relaseDate;
  final String rate;
  final List<int> genre;

  Movie({
    this.id,
    this.title,
    this.description,
    this.topImg,
    this.mainImg,
    this.relaseDate,
    this.rate,
    this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 00,
      title: json['title'] ?? 'no data',
      description: json['overview'] ?? 'no data',
      topImg: json['backdrop_path'],
      mainImg: json['poster_path'],
      relaseDate: json['release_date'] ?? 'no data',
      rate: json['vote_average'].toString() ?? 'no data',
      genre: List<int>.from(json['genre_ids']) ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'topImg': topImg,
      'mainImg': mainImg,
      'relaseDate': relaseDate,
      'rate': rate,
      'genre': genre,
    };
  }
}
