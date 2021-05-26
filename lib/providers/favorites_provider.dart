import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_imdb/models/movie.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favorites = [];
  List<Movie> _favoriteMovies = [];

  List<Movie> get favorites {
    List<Movie> list = _favoriteMovies.map((item) => item).toList();
    return list;
  }

  FavoritesProvider();

  // Future<void> createList({String value}) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _favorites.isEmpty
  //       ? prefs.setStringList('favorites', [])
  //       : prefs.getStringList('favorites');
  //   // notifyListeners();
  // }

  setFavorite(Movie movie) {
    if (_favorites.contains(movie.id.toString())) {
      _favorites.removeWhere((item) => item == movie.id.toString());
      _favoriteMovies
          .removeWhere((item) => item.id.toString() == movie.id.toString());
    } else {
      _favorites.add(movie.id.toString());
      _favoriteMovies.add(movie);
    }

    print(_favoriteMovies);
    notifyListeners();
  }

  Icon favIcon(Movie movie) {
    IconData icon;
    if (_favorites.contains(movie.id.toString())) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return Icon(icon);
  }
}
