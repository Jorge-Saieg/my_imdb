import 'package:flutter/material.dart';

import 'package:my_imdb/models/movie.dart';
import 'package:my_imdb/pages/movie_details_page.dart';
import 'package:my_imdb/widgets/fav_btn_widget.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key key,
    this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetails(
            movie: movie,
          ),
        ),
      ),
      child: Container(
        height: 150,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Row(
              children: [
                movie.mainImg == null
                    ? Container(
                        width: 86.7,
                        child: Center(
                            child: Text('🎬',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30))))
                    : Expanded(
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w200${movie.mainImg}',
                        ),
                      ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: 258,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              movie.title,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(height: 40, child: FavBtn(movie: movie)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          movie.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
