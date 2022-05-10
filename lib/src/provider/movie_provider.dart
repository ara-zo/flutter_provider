import 'package:flutter/foundation.dart';
import 'package:flutter_provider/src/models/movie.dart';
import 'package:flutter_provider/src/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository = MovieRepository();

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  loadMovies() async {
    _movies.clear();
    _movies = await _movieRepository.loadMovies();
    notifyListeners();
  }


}