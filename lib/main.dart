import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:my_imdb/pages/home_page.dart';
import 'package:my_imdb/services/get_popular.dart';
import 'package:my_imdb/services/get_rated.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My IMDb',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.system,
        home: HomePage(),
      ),
    );
  }
}
