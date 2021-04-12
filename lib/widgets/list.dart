import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_imdb/services/get_latest.dart';
import 'package:my_imdb/widgets/card.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  final title;
  final movie;

  const ListWidget({
    Key key,
    this.title,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
          child: Text(
            title,
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            )),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          height: 260,
          child: Consumer<LatestProvider>(
            builder: (context, data, child) => ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => MovieCard(
                //aca me devuelve null no se bien que esta mal debe ser algo del provider en el archivo get_latest mil gracias...
                title: data.getMovie.title,
                imgUrl: data.getMovie.mainImg,
              ),
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
        //   child: Text(
        //     'Populares',
        //     style: GoogleFonts.montserrat(
        //         textStyle: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 21,
        //     )),
        //   ),
        // ),
        // Container(
        //   height: 260,
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     shrinkWrap: true,
        //     children: [
        //       MovieCard(),
        //       MovieCard(),
        //       MovieCard(),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
