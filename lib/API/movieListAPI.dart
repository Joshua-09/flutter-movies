import 'dart:convert';
import 'package:flutter_app/Movie/MovieList.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getSearchMovie(String searchKey) async {
  if (searchKey == "" || searchKey == null) {
    searchKey = 'a';
  }
  // print("searchkey $searchKey");
  var jsonResult;
  var url =
      "https://api.themoviedb.org/3/search/movie?api_key=e63c822c5648e5af78fc3af34bc1fe4b&query=$searchKey&page=1";

  var response = await http.get(url);
  dynamic movies = [];
  // print('movies $movies');
  // print('response ${response.body}');
  var jsonResponse = json.decode(response.body);
  for (var data in jsonResponse['results']) {
    // print('movies $data');
    dynamic movie = {
      'id': data['id'].toString(),
      'title': data['title'].toString(),
      'overview': data["overview"].toString(),
      'posterpath': data['poster_path'],
      'date': data['release_date'].toString(),
    };
    movies.add(movie);
  }
  return movies;
}
