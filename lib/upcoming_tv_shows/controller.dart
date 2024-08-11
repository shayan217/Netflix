import "dart:convert";
import "package:augmented_reality/upcoming_tv_shows/model.dart";
import "package:get/get.dart";
import "package:http/http.dart" as http;
class UpcomingTvShows extends GetxController {
  Future<TVShowModel> fetchtvshows() async {
  var headers = {
    'x-apihub-key': '-nMQOwONYjAlLVcHaDEdnJLw1nqs1YKtznGVPNP7VWSHQ2KEHB',
    'x-apihub-host': 'Movies-Verse.allthingsdev.co',
    'x-apihub-endpoint': 'ee6324b5-b074-419b-ac03-9b818d30321f'
  };  
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://Movies-Verse.proxy-production.allthingsdev.co/api/movies/upcoming-tv-shows'));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    String jsonresponse = await response.stream.bytesToString();
    Map<String, dynamic> jsondata = json.decode(jsonresponse);
    return TVShowModel.fromJson(jsondata);
  } else {
    print(response.reasonPhrase);
  }
  throw {}; // or handle error appropriately
}
}