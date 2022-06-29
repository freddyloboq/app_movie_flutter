import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'package:app_movies_flutter/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '76cd5f3688dc6c710beb07af5a1b0bea';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    // print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }
  getOnDisplayMovies() async {
    // print('getOnDisplayMovies');
    // https://developers.google.com/books/docs/overview
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    // final Map<String, dynamic> decodeData = json.decode(response.body);
    final nowPlaingResponse = NowPlaingResponse.fromJson(response.body);
    // if (response.statusCode != 200) return print('error');

    // print(nowPlaingResponse.results[0].title);
    onDisplayMovies = nowPlaingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
