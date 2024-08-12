import "dart:convert";
import "package:augmented_reality/top_box/top_box_model.dart";
import "package:get/get.dart";
import "package:http/http.dart" as http;

class TopBoxController extends GetxController {
  Future<TopBoxModel> fetchtopbox() async {
    var headers = {
      'x-apihub-key': '-nMQOwONYjAlLVcHaDEdnJLw1nqs1YKtznGVPNP7VWSHQ2KEHB',
      'x-apihub-host': 'Movies-Verse.allthingsdev.co',
      'x-apihub-endpoint': '5122e0f8-a949-45a9-aedf-5eaf61c6085b'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://Movies-Verse.proxy-production.allthingsdev.co/api/movies/top-box-office'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonresponse = await response.stream.bytesToString();
      Map<String, dynamic> jsondata = json.decode(jsonresponse);
      return TopBoxModel.fromJson(jsondata);
    } else {
      print(response.reasonPhrase);
    }
    throw {};
  }
}
