import "dart:convert";
import "package:augmented_reality/upcoming_movies/model.dart";
import "package:http/http.dart" as http;
import 'package:get/get.dart';

class UpcomingMovies extends GetxController {
  Future<MovieModel> fetchMovies() async {
  var headers = {
    'x-apihub-key': '-nMQOwONYjAlLVcHaDEdnJLw1nqs1YKtznGVPNP7VWSHQ2KEHB',
    'x-apihub-host': 'Movies-Verse.allthingsdev.co',
    'x-apihub-endpoint': '4f700f4a-4bd2-4604-8d5b-7b5e4c976c65'
  };
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://Movies-Verse.proxy-production.allthingsdev.co/api/movies/upcoming-movies'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String jsonString = await response.stream.bytesToString();
    return MovieModel.fromJson(json.decode(jsonString));
  } else {
    throw Exception('Failed to load movies');
  }
}
}

