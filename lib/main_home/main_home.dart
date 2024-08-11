import 'package:augmented_reality/celebrities_news/celebrities_news.dart';
import 'package:augmented_reality/celebrities_news/controller.dart';
import 'package:augmented_reality/celebrities_news/model.dart';
import 'package:augmented_reality/movies_news/view.dart';
import 'package:augmented_reality/top250movies/250controller.dart';
import 'package:augmented_reality/top250movies/250model.dart';
import 'package:augmented_reality/top250movies/250view.dart';
import 'package:augmented_reality/upcoming_movies/view.dart';
import 'package:augmented_reality/upcoming_tv_shows/upcoming_tv_shows.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:augmented_reality/movies_news/controller.dart';
import 'package:augmented_reality/movies_news/model.dart';
import 'package:augmented_reality/upcoming_movies/controller.dart';
import 'package:augmented_reality/upcoming_movies/model.dart';
import 'package:augmented_reality/upcoming_tv_shows/controller.dart';
import 'package:augmented_reality/upcoming_tv_shows/model.dart';
import 'package:flutter/foundation.dart';
import 'package:shimmer/shimmer.dart';
class MainHomeMovies extends StatelessWidget {
  final UpcomingMovies upcomingMovies = Get.put(UpcomingMovies());
  final UpcomingTvShows upcomingTvShows = Get.put(UpcomingTvShows());
  final MoviesNewsController moviesNewsController = Get.put(MoviesNewsController());
  final CelebritiesNewsController celebritiesNewsController = Get.put(CelebritiesNewsController());
  final Top250controller top250controller = Get.put(Top250controller());

  MainHomeMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Movies', style: GoogleFonts.montserrat(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 255, 4, 4),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          // Upcoming Movies Section
          FutureBuilder<MovieModel>(
            future: compute(fetchUpcomingMoviesIsolate, upcomingMovies),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Shimmer.fromColors(
                    baseColor: Colors.black38,
                    highlightColor: Colors.grey,
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                );
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
          // Upcoming TV Shows Section
          FutureBuilder<TVShowModel>(
            future: compute(fetchupcomingTvShowsIsolate, upcomingTvShows),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Shimmer.fromColors(
                    baseColor: Colors.black38,
                    highlightColor: Colors.grey,
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                );
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
          // Movies News Section
          FutureBuilder<MoviesNewsModel>(
            // future: moviesNewsController.fetchCelebritiesNews(),
            future: compute(fetchMoviesNewsIsolate, moviesNewsController),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Shimmer.fromColors(
                    baseColor: Colors.black38,
                    highlightColor: Colors.grey,
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.news == null) {
                return Center(child: Text('No data available'));
              } else {
                return buildCategorySection(
                  context,
                  title: 'Movies News',
                  movienews: snapshot.data!.news!,
                  onTap: () {
                    Get.to(() => MovieNews());
                  },
                );
              }
            },
          ),
          // Celebrities News Section
          FutureBuilder<List<Newsof>>(
            future: celebritiesNewsController.fetchCelebritiesNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Shimmer.fromColors(
                    baseColor: Colors.black38,
                    highlightColor: Colors.grey,
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                );
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
          // Top 250 News Section
          FutureBuilder<Top250Modle>(
            // future: top250controller.fetch250data(),
            future: compute(fetchTop250Isolate, top250controller),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Shimmer.fromColors(
                    baseColor: Colors.black38,
                    highlightColor: Colors.grey,
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.movies250!.isEmpty) {
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
        ],
      ),
    );
  }
  //UpcomingMovies
  static Future<MovieModel> fetchUpcomingMoviesIsolate(UpcomingMovies upcomingMovies) async {
    return await upcomingMovies.fetchMovies();
  }
  //UpcomingTVShows
    static Future<TVShowModel> fetchupcomingTvShowsIsolate(UpcomingTvShows upcomingTvShows) async {
    return await upcomingTvShows.fetchtvshows();
  }
  //MoviesNews
    static Future<MoviesNewsModel> fetchMoviesNewsIsolate(MoviesNewsController moviesNewsController) async {
    return await moviesNewsController.fetchCelebritiesNews();
  }
  // Celebritries News
static Future<List<Newsof>> fetchNewsOfIsolate(CelebritiesNewsController celebritiesNewsController) async {
  return await celebritiesNewsController.fetchCelebritiesNews();
}


  // Top 250 movies
    static Future<Top250Modle> fetchTop250Isolate(Top250controller top250controller) async {
    return await top250controller.fetch250data();
  }

  // Build Category Section remains the same
  Widget buildCategorySection(
    BuildContext context, {
    required String title,
    List<Movies>? movies,
    List<TVShowItem>? shows,
    List<News>? movienews,
    List<Newsof>? celebritiesNews,
    List<Movies250>? top250modle,
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
            itemCount: movies?.length ?? shows?.length ?? movienews?.length ?? celebritiesNews?.length ?? top250modle?.length?? 0,
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
              } else if (movienews != null) {
                var news = movienews[index];
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
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
