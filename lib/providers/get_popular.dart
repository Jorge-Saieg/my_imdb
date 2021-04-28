import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_imdb/models/movie.dart';

class PopularProvider extends ChangeNotifier {
  List<Movie> _peliculas = [];

  List<Movie> get peliculas => _peliculas;

  void setPeluculas(List<Movie> peliculas) {
    _peliculas = peliculas;
    notifyListeners();
  }

  PopularProvider() {
    getPopular();
  }

  Future<List<Movie>> getPopular() async {
    try {
      Response response = await Dio().get(
          'https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es&page=1');

      final json = response.data['results'];

      var listOfMovies =
          json.map((popularJson) => Movie.fromJson(popularJson)).toList();
      var peliculas = List<Movie>.from(listOfMovies);
      setPeluculas(peliculas);
      return peliculas;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
