import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_imdb/models/movie.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favoriteIds = [];
  List<Movie> _favoriteMovies = [];

  String _snackbarMessage;

  String get snackbarMessage => this._snackbarMessage;

  List<Movie> get favorites {
    createList();
    return _favoriteMovies;
  }

  FavoritesProvider() {
    createList();
  }

  Future<void> createList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getStringList('favorites') == null
        ? prefs.setStringList('favorites', [])
        : _favoriteMovies = prefs.getStringList('favorites').map((e) {
            _favoriteIds.add(jsonDecode(e)['id'].toString());
            return Movie.fromJson(jsonDecode(e));
          }).toList();
  }

  setFavorite(Movie movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_favoriteIds.contains(movie.id.toString())) {
      _snackbarMessage = 'Eliminada de Favoritos!!';
      _favoriteIds.removeWhere((e) => e == movie.id.toString());
      _favoriteMovies
          .removeWhere((e) => e.id.toString() == movie.id.toString());
      prefs.setStringList(
          'favorites', _favoriteMovies.map((e) => jsonEncode(e)).toList());
    } else {
      _snackbarMessage = 'Agregada a Favoritos!!';
      _favoriteIds.add(movie.id.toString());
      _favoriteMovies.add(movie);
      prefs.setStringList(
          'favorites', _favoriteMovies.map((e) => jsonEncode(e)).toList());
    }
    notifyListeners();
  }

  Future<Icon> favIcon(Movie movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('favorites') == null) {
      return Icon(Icons.favorite_border);
    } else {
      if (_favoriteIds.contains(movie.id.toString())) {
        return Icon(Icons.favorite);
      } else {
        return Icon(Icons.favorite_border);
      }
    }
  }
}
