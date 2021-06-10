import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_imdb/models/movie.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favoriteIds = [];
  List<Movie> _favoriteMovies = [];
  bool _loaded = false;

  bool get getLoaded => _loaded;

  List<Movie> get favorites {
    createList();
    return _favoriteMovies;
  }

  FavoritesProvider() {
    createList();
  }

  Future<void> createList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getStringList('favorites').isEmpty
        ? prefs.setStringList('favorites', [])
        : _favoriteMovies = prefs.getStringList('favorites').map((item) {
            _favoriteIds.add(jsonDecode(item)['id'].toString());
            return Movie.fromJson(jsonDecode(item));
          }).toList();
    _loaded = true;
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

  Future<Icon> favIcon(Movie movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('favorites').isNotEmpty) {
      if (_favoriteIds.contains(movie.id.toString())) {
        return Icon(Icons.favorite);
      } else {
        return Icon(Icons.favorite_border);
      }
    } else {
      return Icon(Icons.favorite_border);
    }
  }

  // Icon favIcon(Movie movie) {
  //   if (_favoriteIds.contains(movie.id.toString())) {
  //     return Icon(Icons.favorite);
  //   } else {
  //     return Icon(Icons.favorite_border);
  //   }
  // }
}
