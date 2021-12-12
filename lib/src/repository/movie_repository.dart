import 'dart:convert';

import 'package:http/http.dart';
import 'package:sample_provider/src/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:sample_provider/.env.dart';

class MovieRepository {
  Map<String, String> queryParam = {
    'api_key': apiKey,
  };

  // api 서버 호출 및 데이터 받아오기
  Future<List<Movie>?> loadMovies() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/popular", queryParam);

    Response response = await http.get(url);
    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      if (body['results'] != null) {
        List<dynamic> list = body['results'];
        return list.map<Movie>((item) => Movie.fromJson(item)).toList();
      }
    }
  }
}
