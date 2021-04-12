import 'package:flutter/material.dart';
import 'package:my_imdb/pages/home_page.dart';
import 'package:my_imdb/services/get_latest.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LatestProvider())
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
