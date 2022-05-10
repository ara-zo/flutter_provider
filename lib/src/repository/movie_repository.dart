import 'dart:convert';

import 'package:flutter_provider/src/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  var queryPram = {'api_key': '2bb68576f283745c105ca5df894b5296'};

  Future<List<Movie>> loadMovies() async {
    var uri = Uri.https("api.themoviedb.org", "/3/movie/popular", queryPram);
    var response = await http.get(uri);

    Map<String, dynamic> body = json.decode(response.body);
    return (body["results"] as List).map<Movie>((e) => Movie.fromJson(e)).toList();
  }
}
