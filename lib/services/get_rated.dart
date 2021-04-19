import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_imdb/classes/movie.dart';

class RatedProvider extends ChangeNotifier {
  List<Movie> _peliculas = [];

  List<Movie> get peliculas => _peliculas;

  void setPeluculas(List<Movie> peliculas) {
    _peliculas = peliculas;
    notifyListeners();
  }

  RatedProvider() {
    getRated();
  }

  Future<List<Movie>> getRated() async {
    try {
      Response response = await Dio().get(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es&page=1');

      final json = response.data['results'];

      var listOfMovies =
          json.map((ratedJson) => Movie.fromJson(ratedJson)).toList();
      var peliculas = List<Movie>.from(listOfMovies);
      setPeluculas(peliculas);
      return peliculas;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
