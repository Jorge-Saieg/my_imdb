import 'package:dio/dio.dart';
import 'package:my_imdb/classes/movie.dart';

Future<List<Movie>> getPopular() async {
  try {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es&page=1');

    final json = response.data['results'];

    var listOfMovies =
        json.map((popularJson) => Movie.fromJson(popularJson)).toList();

    return List<Movie>.from(listOfMovies);
  } catch (e) {
    print(e);
    return [];
  }
}
