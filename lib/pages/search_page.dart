import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final textValue = TextEditingController();

  @override
  void initState() {
    super.initState();
    textValue.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            controller: textValue,
            autofocus: true,
            cursorColor: Colors.amber,
            cursorWidth: 4,
            cursorHeight: 25,
            style: TextStyle(fontSize: 20),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.amber,
                size: 30,
              ),
              suffixIcon: textValue.text.isEmpty
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(
                        Icons.close,
                      ),
                      iconSize: 30,
                      onPressed: () => textValue.clear(),
                    ),
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
