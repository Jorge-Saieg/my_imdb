import 'package:flutter/material.dart';
import 'package:my_imdb/models/movie.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Movie> _favorites = [];

  List<Movie> get favorites => _favorites;

  FavoritesProvider();

  setFavorite(Movie movie) {
    if (_favorites.contains(movie)) {
      _favorites.removeWhere((item) => item.id == movie.id);
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
