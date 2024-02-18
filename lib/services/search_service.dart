import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/model/movie_model.dart';

class MovieSearch {
  static String apiKey = 'ae930ae1382953da5fefce38a0dd8e58';

  static Future<List<Movie>> SearchMovies(String query) async {
    String searchUrl =
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query';
    final url = Uri.parse(searchUrl);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('A Error occured');
    }

    final movieList = jsonDecode(response.body);
    final data = movieList['results'];
    List<Movie> movies = dynamicToList(data);
    for (Movie m in movies) {
      print('this is form search ${m.name}');
    }
    return movies;
  }

  static List<Movie> dynamicToList(data) {
    List<Movie> movieList = [];

    for (int i = 0; i < data.length; i++) {
      String url = '';
      String title = '';

      if (data[i]['poster_path'] != null) {
        url = data[i]['poster_path'];
      }
      if (data[i]['title'] != null) {
        title = data[i]['title'];
      }

      movieList.add(
          Movie(discription: data[i]['overview'], imageUrl: url, name: title));
    }
    return movieList;
  }
}
