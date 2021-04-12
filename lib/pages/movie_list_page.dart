import 'package:flutter/material.dart';
import 'package:my_imdb/widgets/list.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListWidget(
          title: 'Ultimos Lanzamientos',
        ),
        ListWidget(
          title: 'Populares',
        ),
      ],
    );
  }
}
