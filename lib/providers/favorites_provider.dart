import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_imdb/models/movie.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favorites = [];

  List<Movie> get favorites {
    List<Movie> list = _favorites.map((item) => jsonDecode(item));
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
    } else {
      _favorites.add(movie.id.toString());
    }
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
