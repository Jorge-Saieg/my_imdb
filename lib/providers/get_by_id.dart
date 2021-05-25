import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:my_imdb/models/movie.dart';
import 'package:my_imdb/providers/favorites_provider.dart';
import 'package:provider/provider.dart';

class IdsProvider extends ChangeNotifier {
  List<Movie> _peliculas = [];

  List<Movie> get peliculas => _peliculas;

  void setPeluculas(List<Movie> peliculas) {
    _peliculas = peliculas;
    notifyListeners();
  }

  // final favList = Provider.of<FavoritesProvider>(context);

  // IdsProvider() {
  //   for (var item in favList.favorites) {
  //     Movie movie = getById(item);
  //     _peliculas.add(movie);
  //   }
  // }

  Future<Movie> getById(String id) async {
    try {
      Response response = await Dio().get(
          'https://api.themoviedb.org/3/movie/$id?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es');

      final json = response.data;

      Movie byIdMovie = json.map((byIdJson) => Movie.fromJson(byIdJson));

      return byIdMovie;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
