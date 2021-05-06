import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:my_imdb/models/movie.dart';
import 'package:my_imdb/widgets/result_card_widget.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  List<Movie> _peliculas = [];

  List<Movie> get peliculas => _peliculas;

  void setPeluculas(List<Movie> peliculas) {
    _peliculas = peliculas;
    notifyListeners();
  }

  SearchProvider() {
    
    notifyListeners();
  }

  Future<List<Movie>> getSearch(String textValue) async {
    try {
      Response response = await Dio().get(
          'https://api.themoviedb.org/3/search/movie?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es&query=$textValue&page=1&include_adult=false');

      final json = response.data['results'];

      var listOfMovies =
          json.map((ratedJson) => Movie.fromJson(ratedJson)).toList();

      List<Movie> peliculas = List<Movie>.from(listOfMovies);
      setPeluculas(peliculas);
      return _peliculas;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Widget showResults() {
    Widget results;
    print(_peliculas);
    _peliculas.isEmpty
        ? results = Center(
            child: CircularProgressIndicator()
            heightFactor: 15,
          )
        : results = Consumer<SearchProvider>(
            builder: (context, data, child) => data.peliculas.isNotEmpty
                ? ListView.builder(
                    itemCount: data.peliculas.length,
                    itemBuilder: (context, index) => ResultCard(
                      movie: data.peliculas[index],
                    ),
                    shrinkWrap: true,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                    heightFactor: 15,
                  ),
          );

    return results;
  }

}

