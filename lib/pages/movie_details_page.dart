import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_imdb/pages/fav_page.dart';
import 'package:my_imdb/pages/movie_list_page.dart';
import 'package:my_imdb/pages/search_page.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key key}) : super(key: key);

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
                  'https://image.tmdb.org/t/p/w500/79er5H44HZTOhz8HmAGSvc3PoLO.jpg',
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
                            Text('Soy Luna',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.favorite_border_rounded,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            Container(
                              child: Text('Familia'),
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.amber),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              child: Text('Familia'),
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.amber),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              child: Text('Familia'),
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.amber),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              child: Text('Familia'),
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.amber),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              child: Text('Familia'),
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.amber),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              child: Text('Familia'),
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.amber),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              child: Text('Familia'),
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.amber),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
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
                                '4.1',
                                style: TextStyle(fontSize: 26),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Fecha de Estreno'),
                              Text('01-01-2001'),
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
