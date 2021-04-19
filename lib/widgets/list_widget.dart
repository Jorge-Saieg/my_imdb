import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_imdb/services/get_rated.dart';
import 'package:my_imdb/widgets/card_widget.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  final header;
  final provider;

  const ListWidget({
    Key key,
    this.header,
    this.provider,
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
          child: Consumer<provider>(
            builder: (context, data, child) => ListView.builder(
              itemCount: data.peliculas.length,
              itemBuilder: (context, index) => MovieCard(
                title: data.peliculas[index].title,
                imgUrl: data.peliculas[index].mainImg,
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }
}