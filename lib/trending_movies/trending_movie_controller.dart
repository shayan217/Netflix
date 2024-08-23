import "dart:convert";
import "package:augmented_reality/trending_movies/trending_movie_model.dart";
import "package:get/get_state_manager/src/simple/get_controllers.dart";
import "package:http/http.dart" as http;
class TrendingMovieController extends GetxController {
  Future<TrendingMoviesModel> fetchtrendingmovies() async {
    var headers = {
      'x-apihub-key': '-nMQOwONYjAlLVcHaDEdnJLw1nqs1YKtznGVPNP7VWSHQ2KEHB',
      'x-apihub-host': 'Movies-Verse.allthingsdev.co',
      'x-apihub-endpoint': '611cdfda-546d-4cc9-91ab-bfdac3194613'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://Movies-Verse.proxy-production.allthingsdev.co/api/movies/most-popular-movies'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonresponse = await response.stream.bytesToString();
      Map<String, dynamic> jsondata = json.decode(jsonresponse);
      return TrendingMoviesModel.fromJson(jsondata);
    } else {
      print(response.reasonPhrase);
    }
    throw {};
  }
}