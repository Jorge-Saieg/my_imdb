import 'package:flutter/material.dart';
import 'package:my_imdb/widgets/result_card_widget.dart';

import 'package:provider/provider.dart';

import 'package:my_imdb/providers/favorites_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key key}) : super(key: key);

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () {
  //     final provider = Provider.of<FavoritesProvider>(context, listen: false);
  //     provider.createList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, data, child) => data.favorites.isNotEmpty
          ? ListView.builder(
              itemCount: data.favorites.length,
              itemBuilder: (BuildContext context, int index) {
                print(data.favorites);
                return ResultCard(movie: data.favorites[index]);
              },
            )
          : Container(),
    );
  }
}
