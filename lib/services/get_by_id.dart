import 'package:dio/dio.dart';
import 'package:my_imdb/models/movie.dart';

Future<List<Movie>> getById(int id) async {
  try {
    Response response = await Dio().get(
        'https://api.themoviedb.org/3/movie/$id?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es');

    final json = response.data;

    var byIdMovie = json.map((byIdJson) => Movie.fromJson(byIdJson)).toList();

    return List<Movie>.from(byIdMovie);
  } catch (e) {
    print(e);
    return [];
  }
}
