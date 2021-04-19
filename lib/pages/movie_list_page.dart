import 'package:flutter/material.dart';
import 'package:my_imdb/services/get_popular.dart';
import 'package:my_imdb/services/get_rated.dart';
import 'package:my_imdb/widgets/list_widget.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListWidget(
          header: 'Mejores Valoradas',
          provider: RatedProvider,
        ),
        ListWidget(
          header: 'Populares',
          provider: PopularProvider,
        ),
      ],
    );
  }
}
