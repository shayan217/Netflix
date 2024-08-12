import 'package:augmented_reality/celebrities_news/celebrities_news.dart';
import 'package:augmented_reality/main_home/main_home.dart';
import 'package:augmented_reality/main_home/second_home.dart';
import 'package:augmented_reality/movies_news/movie_news_view.dart';
import 'package:augmented_reality/top250movies/250view.dart';
import 'package:augmented_reality/top_box/top_box_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainHomeMovies(),
        // home: SecondHome(),
      // home: TopBoxView(),
      // home: MovieNewsViewAdvance(),
    );
  }
}