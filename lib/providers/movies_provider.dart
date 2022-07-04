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
  Map<int, List<Cast>> moviesCast = {};
  int _popularPage = 0;

  MoviesProvider() {
    // print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endPoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    // print('getOnDisplayMovies');
    // https://developers.google.com/books/docs/overview
    // var url = Uri.https(_baseUrl, '3/movie/now_playing',
    //     {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // // Await the http get response, then decode the json-formatted response.
    // final response = await http.get(url);
    final jsonData = await _getJsonData('3/movie/now_playing');
    // final Map<String, dynamic> decodeData = json.decode(response.body);
    final nowPlaingResponse = NowPlaingResponse.fromJson(jsonData);
    // if (response.statusCode != 200) return print('error');

    // print(nowPlaingResponse.results[0].title);
    onDisplayMovies = nowPlaingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    // var url = Uri.https(_baseUrl, '3/movie/popular',
    //     {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // final response = await http.get(url);
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    //TODO: revisar el mapa
    // print('pidiendo info al servidor-cast');
    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
