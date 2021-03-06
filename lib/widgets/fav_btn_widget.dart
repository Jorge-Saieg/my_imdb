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

    return FutureBuilder(
        future: provider.favIcon(movie),
        builder: (BuildContext context, AsyncSnapshot<Icon> snapshot) {
          return snapshot.hasData
              ? IconButton(
                  icon: snapshot.data,
                  color: Colors.amber,
                  onPressed: () async {
                    await provider.setFavorite(movie);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        provider.snackbarMessage,
                        style: TextStyle(color: Colors.grey[100]),
                      ),
                      backgroundColor: Colors.grey[800],
                      behavior: SnackBarBehavior.fixed,
                      duration: Duration(seconds: 1),
                    ));
                  })
              : Container();
        });
  }
}
