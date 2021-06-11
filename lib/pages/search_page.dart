import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:my_imdb/providers/search_provider.dart';
import 'package:my_imdb/widgets/result_card_widget.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    String textValue = controller.text;

    final searchProvider = Provider.of<SearchProvider>(context);

    return Stack(
      children: [
        searchProvider.peliculas.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.only(top: 40),
                shrinkWrap: true,
                itemCount: searchProvider.peliculas.length,
                itemBuilder: (BuildContext context, int index) {
                  return ResultCard(
                    movie: searchProvider.peliculas[index],
                  );
                },
              )
            : Container(
                child: Center(
                    heightFactor: 6,
                    child: Text(
                      'Buscate algo...',
                      style: TextStyle(fontSize: 22, color: Colors.grey[700]),
                    )),
              ),
        Container(
          height: 50,
          child: TextField(
            controller: controller,
            autofocus: true,
            cursorColor: Colors.amber,
            cursorWidth: 4,
            cursorHeight: 25,
            style: TextStyle(fontSize: 20),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              fillColor: Colors.grey[850],
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.amber,
                size: 30,
              ),
              suffixIcon: textValue.isEmpty
                  ? Container(width: 0)
                  : IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.amber,
                      ),
                      iconSize: 30,
                      onPressed: () => controller.clear(),
                    ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey[800],
                  width: 2.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              hintText: 'Buscar',
            ),
            onSubmitted: (textValue) async {
              if (textValue.isNotEmpty) {
                await searchProvider.getSearch(textValue);
              }
            },
          ),
        ),
      ],
    );
  }
}
