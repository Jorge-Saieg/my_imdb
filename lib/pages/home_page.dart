import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_imdb/pages/fav_page.dart';
import 'package:my_imdb/pages/movie_list_page.dart';
import 'package:my_imdb/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: _pages[_currentIndex],
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
