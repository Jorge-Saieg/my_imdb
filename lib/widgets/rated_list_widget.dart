import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:my_imdb/providers/get_rated.dart';
import 'package:my_imdb/widgets/card_widget.dart';

class RatedListWidget extends StatelessWidget {
  final header;

  const RatedListWidget({
    Key key,
    this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
          child: Text(
            header,
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            )),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          height: 315,
          child: Consumer<RatedProvider>(
            builder: (context, data, child) => ListView.builder(
              itemCount: data.peliculas.length,
              itemBuilder: (context, index) => MovieCard(
                movie: data.peliculas[index],
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }
}
