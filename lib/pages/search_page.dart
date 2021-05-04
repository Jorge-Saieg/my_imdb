import 'package:flutter/material.dart';
import 'package:my_imdb/models/movie.dart';

import 'package:provider/provider.dart';

import 'package:my_imdb/providers/search_provider.dart';
import 'package:my_imdb/widgets/result_widget.dart';

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
    List<Movie> listaResultados = [];

    return ListView(
      children: [
        TextField(
          controller: controller,
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
            suffixIcon: textValue.isEmpty
                ? Container(width: 0)
                : IconButton(
                    icon: Icon(
                      Icons.close,
                    ),
                    iconSize: 30,
                    onPressed: () => controller.clear(),
                  ),
            focusColor: Colors.amber,
            // border: OutlineInputBorder(),
            hintText: 'Buscar',
          ),
          onSubmitted: (textValue) async {
            listaResultados = await SearchProvider().getSearch(textValue);
            print(listaResultados);
            setState(() {});
          },
        ),
        Text(listaResultados.toString()),
        // no entiendo pq con el print (linea 61) se imprime y en esta linea no logro mostrarlo...

        // alternativa 1
        ListView.builder(
          shrinkWrap: true,
          itemCount: listaResultados.length,
          itemBuilder: (BuildContext context, int index) {
            return ResultCard(
              movie: listaResultados[index],
            );
          },
        ),

        // alternativa 2
        // Consumer<SearchProvider>(
        //   builder: (context, data, child) => Text(data.peliculas.toString()),
        // )

        // alternativa 3
        // Consumer<SearchProvider>(
        //   builder: (context, data, child) => data.peliculas != []
        //       ? ListView.builder(
        //           itemCount: data.peliculas.length,
        //           itemBuilder: (context, index) => ResultCard(
        //             movie: data.peliculas[index],
        //           ),
        //           shrinkWrap: true,
        //         )
        //       : Container(),
        // )
      ],
    );
  }
}
