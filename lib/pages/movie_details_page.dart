import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_imdb/models/genre.dart';
import 'package:my_imdb/models/movie.dart';
import 'package:my_imdb/pages/fav_page.dart';
import 'package:my_imdb/pages/movie_list_page.dart';
import 'package:my_imdb/pages/search_page.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    Key key,
    this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    MovieList(),
    SearchPage(),
    FavPage(),
  ];

  _MovieDetailsState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My IMDb',
          style: GoogleFonts.oswald(
              textStyle:
                  TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
        ),
      ),
      body: _currentIndex != 0
          ? _pages[_currentIndex]
          : ListView(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500/${widget.movie.topImg}',
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.movie.title,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Icon(
                              Icons.favorite_border_rounded,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        child: ListView.builder(
                          itemCount: widget.movie.genre.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                            child: Text(getGenre(widget.movie.genre[index])),
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.amber),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      Text(widget.movie.description,
                          style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: Colors.amber,
                                size: 30,
                              ),
                              Text(
                                widget.movie.rate,
                                style: TextStyle(fontSize: 26),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Fecha de Estreno'),
                              Text(widget.movie.relaseDate),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTap,
        fixedColor: Colors.amber[600],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter_rounded),
            label: 'Peliculas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
