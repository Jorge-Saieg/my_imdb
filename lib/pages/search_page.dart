import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            autofocus: true,
            cursorColor: Colors.amber,
            cursorWidth: 4,
            cursorHeight: 35,
            style: TextStyle(fontSize: 20),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              focusColor: Colors.amber,

              // border: OutlineInputBorder(),
              hintText: 'Buscar',
            ),
          ),
        ],
      ),
    );
  }
}
