import 'package:flutter/material.dart';
import 'package:my_imdb/pages/movie_details_page.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    this.title,
    this.imgUrl,
    this.favorite,
  }) : super(key: key);

  final String title;
  final String imgUrl;
  final bool favorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetails(),
        ),
      ),
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
                    // FadeInImage(
                    //   placeholder: AssetImage(
                    //     'assets/images/loading.gif',
                    //   ),
                    //   image: NetworkImage(
                    //     'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1P3ZyEq02wcTMd3iE4ebtLvncvH.jpg',
                    //     scale: 3.1,
                    //   ),
                    //   fit: BoxFit.fitHeight,
                    // ),
                    Image.network(
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/$imgUrl',
                      width: 130,
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      child: Text(
                        title,
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
          )),
    );
  }
}
