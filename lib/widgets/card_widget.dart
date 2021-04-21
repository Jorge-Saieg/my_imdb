import 'package:flutter/material.dart';
import 'package:my_imdb/models/movie.dart';
import 'package:my_imdb/pages/movie_details_page.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
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
        width: 180,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.fromLTRB(15, 20, 0, 20),
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Column(
                  children: [
                    FadeInImage(
                      placeholder: AssetImage(
                        'assets/images/loading.gif',
                      ),
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/w200/${movie.mainImg}',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          movie.title,
                          maxLines: 2,
                          // overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: FloatingActionButton(
                    heroTag: Object(),
                    backgroundColor: Colors.transparent,
                    elevation: 10,
                    foregroundColor: Colors.amber,
                    onPressed: null,
                    child: Icon(Icons.favorite_border),
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
