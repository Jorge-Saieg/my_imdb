import 'package:flutter/material.dart';
import 'package:my_imdb/providers/favorites_provider.dart';
import 'package:my_imdb/providers/search_provider.dart';

import 'package:provider/provider.dart';

import 'package:my_imdb/pages/home_page.dart';
import 'package:my_imdb/providers/get_popular.dart';
import 'package:my_imdb/providers/get_rated.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RatedProvider()),
        ChangeNotifierProvider(create: (context) => PopularProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My IMDb',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
          accentColor: Colors.amber,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.amber,
        ),
        themeMode: ThemeMode.system,
        home: HomePage(),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
