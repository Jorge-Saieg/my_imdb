import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:my_imdb/widgets/result_card_widget.dart';
import 'package:my_imdb/providers/favorites_provider.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key key}) : super(key: key);

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, data, child) => data.favorites.isNotEmpty
          ? ListView.builder(
              itemCount: data.favorites.length,
              itemBuilder: (BuildContext context, int index) {
                return ResultCard(movie: data.favorites[index]);
              },
            )
          : Container(),
    );
  }
}
