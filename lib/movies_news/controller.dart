// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'model.dart';

// class MoviesNewsController extends GetxController {
//   Future<List<News>> fetchCelebritiesNews() async {
//     var headers = {
//       'x-apihub-key': '-nMQOwONYjAlLVcHaDEdnJLw1nqs1YKtznGVPNP7VWSHQ2KEHB',
//       'x-apihub-host': 'Movies-Verse.allthingsdev.co',
//       'x-apihub-endpoint': '9f3f88f2-24e7-486e-8360-0c8d1f223079'
//     };

//     var request = http.Request(
//       'GET',
//       Uri.parse(
//           'https://Movies-Verse.proxy-production.allthingsdev.co/api/movies/get-movie-news'),
//     );
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       String responseBody = await response.stream.bytesToString();
//       Map<String, dynamic> jsonData = json.decode(responseBody);
//       List<dynamic> newsList = jsonData['news'];
//       return newsList.map((e) => News.fromJson(e)).toList();
//     } else {
//       print(response.reasonPhrase);
//       throw Exception('Failed to load movies news');
//     }
//   }
// }








import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class MoviesNewsController extends GetxController {
  Future<MoviesNewsModel> fetchCelebritiesNews() async {
    var headers = {
      'x-apihub-key': '-nMQOwONYjAlLVcHaDEdnJLw1nqs1YKtznGVPNP7VWSHQ2KEHB',
      'x-apihub-host': 'Movies-Verse.allthingsdev.co',
      'x-apihub-endpoint': '9f3f88f2-24e7-486e-8360-0c8d1f223079'
    };

    var request = http.Request(
      'GET',
      Uri.parse(
          'https://Movies-Verse.proxy-production.allthingsdev.co/api/movies/get-movie-news'),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonData = json.decode(responseBody);
      return MoviesNewsModel.fromJson(jsonData);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load movies news');
    }
  }
}