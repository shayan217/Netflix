import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:augmented_reality/celebrities_news/model.dart';
class CelebritiesNewsController extends GetxController {
  Future<List<Newsof>> fetchCelebritiesNews() async {
    var headers = {
      'x-apihub-key': '-nMQOwONYjAlLVcHaDEdnJLw1nqs1YKtznGVPNP7VWSHQ2KEHB',
      'x-apihub-host': 'Movies-Verse.allthingsdev.co',
      'x-apihub-endpoint': '310bc946-0139-4f0d-a955-1f7ab9e122c9',
    };
    var request = http.Request(
      'GET',
      Uri.parse(
        'https://Movies-Verse.proxy-production.allthingsdev.co/api/movies/get-celebrities-news',
      ),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonData = json.decode(responseBody);
      List<dynamic> newsList = jsonData['news'];
      // Ensuring no duplicate data
      return newsList.map((e) => Newsof.fromJson(e)).toSet().toList();
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load celebrities news');
    }
  }
}
