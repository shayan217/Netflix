import 'package:augmented_reality/celebrities_news/celebrities_news.dart';
import 'package:augmented_reality/celebrities_news/controller.dart';
import 'package:augmented_reality/celebrities_news/model.dart';
import 'package:augmented_reality/main_home/second_home.dart';
import 'package:augmented_reality/top250movies/250controller.dart';
import 'package:augmented_reality/top250movies/250model.dart';
import 'package:augmented_reality/top250movies/250view.dart';
import 'package:augmented_reality/top_box/top_box_controller.dart';
import 'package:augmented_reality/top_box/top_box_model.dart';
import 'package:augmented_reality/top_box/top_box_view.dart';
import 'package:augmented_reality/upcoming_movies/view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:augmented_reality/upcoming_movies/controller.dart';
import 'package:augmented_reality/upcoming_movies/model.dart';
import 'package:augmented_reality/upcoming_tv_shows/model.dart';
import 'package:flutter/foundation.dart';
import 'package:shimmer/shimmer.dart';
class MainHomeMovies extends StatelessWidget {
  final UpcomingMovies upcomingMovies = Get.put(UpcomingMovies());
  final CelebritiesNewsController celebritiesNewsController =
      Get.put(CelebritiesNewsController());
  final Top250controller top250controller = Get.put(Top250controller());
  final TopBoxController topBoxController = Get.put(TopBoxController());
  MainHomeMovies({super.key});
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
          FutureBuilder<MovieModel>(
            future: compute(fetchUpcomingMoviesIsolate, upcomingMovies),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return buildShimmerEffect();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.movies == null) {
                return Center(child: Text('No data available'));
              } else {
                return buildCategorySection(
                  context,
                  title: 'Upcoming Movies',
                  movies: snapshot.data!.movies!,
                  onTap: () {
                    Get.to(() => ViewScreen());
                  },
                );
              }
            },
          ),
          FutureBuilder<List<Newsof>>(
            future: celebritiesNewsController.fetchCelebritiesNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return buildShimmerEffect();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data available'));
              } else {
                return buildCategorySection(
                  context,
                  title: 'Celebrities News',
                  celebritiesNews: snapshot.data!,
                  onTap: () {
                    Get.to(() => CelebritiesNews());
                  },
                );
              }
            },
          ),
          FutureBuilder<Top250Modle>(
            future: compute(fetchTop250Isolate, top250controller),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return buildShimmerEffect();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData ||
                  snapshot.data!.movies250!.isEmpty) {
                return Center(child: Text('No data available'));
              } else {
                return buildCategorySection(
                  context,
                  title: 'Top 250 News',
                  top250modle: snapshot.data!.movies250!,
                  onTap: () {
                    Get.to(() => Top250Movies());
                  },
                );
              }
            },
          ),
          FutureBuilder<TopBoxModel>(
            future: compute(fetchTopBoxIsolate, topBoxController),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return buildShimmerEffect();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData ||
                  snapshot.data!.topboxmovies!.isEmpty) {
                return Center(child: Text('No data available'));
              } else {
                return buildCategorySection(
                  context,
                  title: 'Top Box Movies',
                  topBoxMovies: snapshot.data!.topboxmovies!,
                  onTap: () {
                    Get.to(() => TopBoxView());
                  },
                );
              }
            },
          ),
          SizedBox(height: 15,),
          ElevatedButton(
  onPressed: () {
    Get.to(SecondHome());
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 255, 4, 4),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 5,
  ),
  child: Text(
    "Additional",
    style: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
  ),
)
        ],
      ),
    );
  }
  static Future<MovieModel> fetchUpcomingMoviesIsolate(
      UpcomingMovies upcomingMovies) async {
    return await upcomingMovies.fetchMovies();
  }
  static Future<List<Newsof>> fetchNewsOfIsolate(
      CelebritiesNewsController celebritiesNewsController) async {
    return await celebritiesNewsController.fetchCelebritiesNews();
  }
  static Future<Top250Modle> fetchTop250Isolate(
      Top250controller top250controller) async {
    return await top250controller.fetch250data();
  }
  static Future<TopBoxModel> fetchTopBoxIsolate(
      TopBoxController topBoxController) async {
    return await topBoxController.fetchtopbox();
  }
  Widget buildCategorySection(
    BuildContext context, {
    required String title,
    List<Movies>? movies,
    List<TVShowItem>? shows,
    List<Newsof>? celebritiesNews,
    List<Movies250>? top250modle,
    List<TopBoxMovies>? topBoxMovies,
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
            itemCount: movies?.length ??
                shows?.length ??
                celebritiesNews?.length ??
                top250modle?.length ??
                topBoxMovies?.length ??
                0,
            itemBuilder: (context, index) {
              if (movies != null) {
                var movie = movies[index];
                return Container(
                  width: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      movie.list?.first.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else if (shows != null) {
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
              } else if (celebritiesNews != null) {
                var news = celebritiesNews[index];
                return Container(
                  width: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      news.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else if (top250modle != null) {
                var top250modlenews = top250modle[index];
                return Container(
                  width: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      top250modlenews.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }else if (topBoxMovies != null) {
                var topBoxMoviesimage = topBoxMovies[index];
                return Container(
                  width: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      topBoxMoviesimage.image ?? '',
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
  Widget buildShimmerEffect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Loading...',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: GoogleFonts.montserrat(
                  color: Color.fromARGB(255, 255, 4, 4),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[800]!,
                  highlightColor: Colors.grey[600]!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}