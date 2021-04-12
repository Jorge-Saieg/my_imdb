import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite),
          Text('paciencia...'),
        ],
      ),
    );
  }
}
