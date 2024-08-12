import 'package:augmented_reality/movies_news/movie_news_controller.dart';
import 'package:augmented_reality/movies_news/movie_news_model.dart';
import 'package:augmented_reality/movies_news/movie_news_view.dart';
import 'package:augmented_reality/upcoming_tv_shows/upcoming_tv_shows.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:augmented_reality/upcoming_tv_shows/controller.dart';
import 'package:augmented_reality/upcoming_tv_shows/model.dart';
import 'package:flutter/foundation.dart';
class SecondHome extends StatelessWidget {
  final UpcomingTvShows upcomingTvShows = Get.put(UpcomingTvShows());
  final MovieNewsAdvanceController movieNewsAdvanceController = Get.put(MovieNewsAdvanceController());
  SecondHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text('Movies', style: GoogleFonts.montserrat(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 255, 4, 4),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          FutureBuilder<TVShowModel>(
            future: compute(fetchupcomingTvShowsIsolate, upcomingTvShows),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.items == null) {
                return Center(child: Text('No data available'));
              } else {
                return buildCategorySection(
                  context,
                  title: 'Upcoming TV Shows',
                  shows: snapshot.data!.items!,
                  onTap: () {
                    Get.to(() => TVShows());
                  },
                );
              }
            },
          ),
          FutureBuilder<MoviesNewsAdvance>(
            future: compute(fetchmovienewsIsolate, movieNewsAdvanceController),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.newsmovieadvance == null) {
                return Center(child: Text('No data available'));
              } else {
                return buildCategorySection(
                  context,
                  title: 'Movies News',
                  newsMovieAdvance: snapshot.data!.newsmovieadvance!,
                  onTap: () {
                    Get.to(() => MovieNewsViewAdvance());
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
  //UpcomingTVShows
  static Future<TVShowModel> fetchupcomingTvShowsIsolate(
      UpcomingTvShows upcomingTvShows) async {
    return await upcomingTvShows.fetchtvshows();
  }
    //MoviesNews
  static Future<MoviesNewsAdvance> fetchmovienewsIsolate(
      MovieNewsAdvanceController movieNewsAdvanceController) async {
    return await movieNewsAdvanceController.fetchmovienewsadvance();
  }
  Widget buildCategorySection(
    BuildContext context, {
    required String title,
    List<TVShowItem>? shows,
    List<NewsMovieAdvance>? newsMovieAdvance,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: onTap,
                child: const Text(
                  'See All',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shows?.length ?? newsMovieAdvance?.length ?? 0,
            itemBuilder: (context, index) {
               if (shows != null) {
                var show = shows[index].shows?.first;
                return Container(
                  width: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      show?.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }else if (newsMovieAdvance != null) {
                var newsMovieAdvancenew = newsMovieAdvance[index];
                return Container(
                  width: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      newsMovieAdvancenew.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
               else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}