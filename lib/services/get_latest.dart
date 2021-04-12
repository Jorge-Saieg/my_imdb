import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_imdb/classes/movie.dart';

class LatestProvider extends ChangeNotifier {
  String _title;
  String _mainImg;

  String get title => _title;

  set title(String title) {
    _title = title;
    notifyListeners();
  }

  get mainImg => _mainImg;

  set mainImg(String mainImg) {
    _mainImg = mainImg;
    notifyListeners();
  }

  Movie _movie;

  Movie get getMovie => _movie;

  void setMovie({Movie movie}) {
    _movie = movie;
    notifyListeners();
  }

  Future<List<Movie>> getLatest() async {
    try {
      Response response = await Dio().get(
          'https://api.themoviedb.org/3/movie/latest?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es&page=1');

      final json = response.data['results'];

      var listOfMovies =
          json.map((latestJson) => Movie.fromJson(latestJson)).toList();

      return List<Movie>.from(listOfMovies);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
