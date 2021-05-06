import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_imdb/models/movie.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Movie> _favorites = [];

  List<Movie> get favorites => _favorites;

  FavoritesProvider();

  Future<bool> createList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites') ??
        await prefs.setStringList('favorites', []);
    // notifyListeners();
  }

  setFavorite(Movie movie) {
    if (_favorites.contains(movie)) {
      _favorites.removeWhere((item) => item == movie);
    } else {
      _favorites.add(movie);
    }
    notifyListeners();
  }

  Icon favIcon(Movie movie) {
    IconData icon;
    if (_favorites.contains(movie)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return Icon(icon);
  }
}
