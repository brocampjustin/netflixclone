import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:netflix/model/movie_model.dart';

class TrendingNow {
  static String apiKey = 'ae930ae1382953da5fefce38a0dd8e58';
  static Future<List<MovieTrending>> trendingNow() async {
    String trendingMovies =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
    final url = Uri.parse(trendingMovies);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to get trending movies');
    }

    final movieList = jsonDecode(response.body);
    final data = movieList['results'];

    List<MovieTrending> movies = dynamicToLIst(data);
    for (MovieTrending m in movies) {
      print("trending now${m.discription}");
    }

    return movies;
  }

  static List<MovieTrending> dynamicToLIst(data) {
    List<MovieTrending> movieList = [];
    String title = '';
    String iurl = '';

    for (int i = 0; i < data.length; i++) {
      if (data[i]['original_title'] != null) {
        title = data[i]['original_title'];
      }
      if (data[i]['backdrop_path'] != null) {
        iurl = data[i]['backdrop_path'];
      }
      movieList.add(MovieTrending(
        discription: data[i]['overview'],
        imageUrl: iurl,
        name: title,
        date: data[i]['release_date'],
      ));
    }
    return movieList;
  }
}
