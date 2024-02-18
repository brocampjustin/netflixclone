import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/model/movie_model.dart';

class TVshowService {
  static String apiKey = 'ae930ae1382953da5fefce38a0dd8e58';
  static String apiAccessTocken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzQ1MTg4ZjljN2NlM2QyYzA1YmY1ZDZjMmY2MzQyZCIsInN1YiI6IjY1Y2Y0ZmJkOWFjNTM1MDE4NGUwNTNlYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BWiI5PvmmPSqi4wVjh3mqX_pDEOr4qJ8f2oehzpwDy8';

  static Future<List<Movie>> popularTV() async {
    String trendingMovies =
        'https://api.themoviedb.org/3/tv/popular?api_key=$apiKey';
    final url = Uri.parse(trendingMovies);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to get trending movies Tv shows');
    }

    final movieList = jsonDecode(response.body);
    final data = movieList['results'];

    List<Movie> movies = dynamicToLIst(data);

    for (Movie m in movies) {
      print("tv 156${m.name}");
    }

    return movies;
  }

  static Future<List<Movie>> topRatedTV() async {
    String trendingMovies =
        'https://api.themoviedb.org/3/tv/top_rated?api_key=$apiKey';
    final url = Uri.parse(trendingMovies);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to get trending movies');
    }

    final movieList = jsonDecode(response.body);
    final data = movieList['results'];

    List<Movie> movies = dynamicToLIst(data);

    return movies;
  }

  static List<Movie> dynamicToLIst(data) {
    List<Movie> movieList = [];

    for (int i = 0; i < data.length; i++) {
      movieList.add(Movie(
          discription: data[i]['overview'],
          imageUrl: data[i]['backdrop_path'],
          name: data[i]['name']));
    }

    return movieList;
  }
}
