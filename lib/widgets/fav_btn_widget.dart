import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:my_imdb/models/movie.dart';
import 'package:my_imdb/providers/favorites_provider.dart';

class FavBtn extends StatelessWidget {
  const FavBtn({Key key, this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesProvider>(context);
    return IconButton(
      icon: provider.favIcon(movie),
      color: Colors.amber,
      onPressed: () {
        provider.setFavorite(movie);
      },
    );
  }
}
