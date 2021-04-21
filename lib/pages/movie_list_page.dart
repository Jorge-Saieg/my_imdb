import 'package:flutter/material.dart';
import 'package:my_imdb/widgets/popular_list_widget.dart';
import 'package:my_imdb/widgets/rated_list_widget.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RatedListWidget(
          header: 'Mejores Valoradas',
        ),
        PopularListWidget(
          header: 'Populares',
        ),
      ],
    );
  }
}
