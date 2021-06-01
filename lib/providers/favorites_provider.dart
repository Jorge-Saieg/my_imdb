import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_imdb/models/movie.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favoriteIds = [];
  List<Movie> _favoriteMovies = [];

  List<Movie> get favorites {
    createList();
    return _favoriteMovies;
  }

  FavoritesProvider() {
    createList();
  }

  Future<void> createList({String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.getStringList('favorites').isEmpty
        ? prefs.setStringList('favorites', [])
        : _favoriteMovies = prefs.getStringList('favorites').map((item) {
            _favoriteIds.add(jsonDecode(item)['id'].toString());
            return Movie.fromJson(jsonDecode(item));
          }).toList();
  }

  // set toggle - item -

  setFavorite(Movie movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_favoriteIds.contains(movie.id.toString())) {
      _favoriteIds.removeWhere((item) => item == movie.id.toString());
      _favoriteMovies
          .removeWhere((item) => item.id.toString() == movie.id.toString());
      prefs.setStringList('favorites',
          _favoriteMovies.map((item) => jsonEncode(item)).toList());
    } else {
      _favoriteIds.add(movie.id.toString());
      _favoriteMovies.add(movie);
      prefs.setStringList('favorites',
          _favoriteMovies.map((item) => jsonEncode(item)).toList());
    }
    print('prefs 👉:' + prefs.getStringList('favorites').toString());
    print(_favoriteMovies);
    print(_favoriteIds);
    notifyListeners();
  }

  Icon favIcon(Movie movie) {
    IconData icon;
    if (_favoriteIds.contains(movie.id.toString())) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return Icon(icon);
  }
}
