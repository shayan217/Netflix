import "dart:convert";
import "package:augmented_reality/top250movies/250model.dart";
import "package:get/get_state_manager/src/simple/get_controllers.dart";
import "package:http/http.dart" as http;
class Top250controller extends GetxController {
  Future<Top250Modle> fetch250data() async {
    var headers = {
      'x-apihub-key': '-nMQOwONYjAlLVcHaDEdnJLw1nqs1YKtznGVPNP7VWSHQ2KEHB',
      'x-apihub-host': 'Movies-Verse.allthingsdev.co',
      'x-apihub-endpoint': 'd3ee0b1f-e51c-46bc-99eb-c660726b0a1b'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://Movies-Verse.proxy-production.allthingsdev.co/api/movies/top-250-movies'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      return Top250Modle.fromJson(json.decode(jsonString));
    } else {
      print(response.reasonPhrase);
    }
    throw {};
  }
}