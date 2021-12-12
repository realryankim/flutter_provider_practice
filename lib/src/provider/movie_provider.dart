import 'package:flutter/material.dart';
import 'package:sample_provider/src/model/movie.dart';
import 'package:sample_provider/src/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  // List<Map<String, dynamic>>

  // Map 타입보다는 Movie라는 Model class로 관리
  List<Movie>? _movies = [];
  List<Movie>? get movies => _movies;

  MovieRepository _movieRepository = MovieRepository();

  loadMovies() async {
    List<Movie>? listMovies = await _movieRepository.loadMovies();
    // _movies에 바로 데이터를 할당해도 되지만,
    // listMovies로 나눠서 사용하는 이유는
    // listMovies 예외 처리 해주고, 추가적인 가공절차가 필요하기때문
    _movies = listMovies;
    notifyListeners();
  }
}
