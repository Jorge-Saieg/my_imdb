import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_imdb/models/movie.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  FavoritesProvider();

  // Future<void> createList({String value}) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _favorites.isEmpty
  //       ? prefs.setStringList('favorites', [])
  //       : prefs.getStringList('favorites');
  //   // notifyListeners();
  // }

  setFavorite(String id) {
    if (_favorites.contains(id)) {
      _favorites.removeWhere((item) => item == id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
  }

  Icon favIcon(String id) {
    IconData icon;
    if (_favorites.contains(id)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return Icon(icon);
  }
}
