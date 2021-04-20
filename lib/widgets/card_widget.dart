import 'package:flutter/material.dart';
import 'package:my_imdb/pages/movie_details_page.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    this.id,
    this.title,
    this.imgUrl,
    this.topImg,
    this.genere,
    this.description,
    this.relaseDate,
    this.rate,
    this.favorite,
  }) : super(key: key);

  final int id; /* a confirmar */
  final String title;
  final String imgUrl;
  final String topImg;
  final List<int> genere;
  final String description;
  final String relaseDate;
  final String rate;
  final bool favorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetails(
            topImg: topImg,
            title: title,
            genere: genere,
            description: description,
            rate: rate,
            relaseDate: relaseDate,
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
                        'https://image.tmdb.org/t/p/w200/$imgUrl',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: FloatingActionButton(
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
