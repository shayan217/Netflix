import "dart:convert";
import "package:augmented_reality/movies_news/movie_news_model.dart";
import "package:get/get_state_manager/src/simple/get_controllers.dart";
import "package:http/http.dart" as http;

class MovieNewsAdvanceController extends GetxController {
  Future<MoviesNewsAdvance> fetchmovienewsadvance() async {
    var headers = {
      'x-apihub-key': '-nMQOwONYjAlLVcHaDEdnJLw1nqs1YKtznGVPNP7VWSHQ2KEHB',
      'x-apihub-host': 'Movies-Verse.allthingsdev.co',
      'x-apihub-endpoint': '9f3f88f2-24e7-486e-8360-0c8d1f223079'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://Movies-Verse.proxy-production.allthingsdev.co/api/movies/get-movie-news'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonresponse = await response.stream.bytesToString();
      Map<String, dynamic> jsondata = json.decode(jsonresponse);
      return MoviesNewsAdvance.fromJson(jsondata);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data');
    }
  }
}
