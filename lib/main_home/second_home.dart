import 'package:augmented_reality/movies_news/movie_news_controller.dart';
import 'package:augmented_reality/movies_news/movie_news_model.dart';
import 'package:augmented_reality/movies_news/movie_news_view.dart';
import 'package:augmented_reality/trending_movies/trending_movie_controller.dart';
import 'package:augmented_reality/trending_movies/trending_movie_model.dart';
import 'package:augmented_reality/trending_movies/trending_movie_view.dart';
import 'package:augmented_reality/upcoming_tv_shows/upcoming_tv_shows.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:augmented_reality/upcoming_tv_shows/controller.dart';
import 'package:augmented_reality/upcoming_tv_shows/model.dart';
import 'package:flutter/foundation.dart';
import 'package:shimmer/shimmer.dart';
class SecondHome extends StatelessWidget {
  final UpcomingTvShows upcomingTvShows = Get.put(UpcomingTvShows());
  final MovieNewsAdvanceController movieNewsAdvanceController =
      Get.put(MovieNewsAdvanceController());
  final TrendingMovieController trendingMovieController =
      Get.put(TrendingMovieController());
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
                return buildShimmerEffect();
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
                return buildShimmerEffect();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData ||
                  snapshot.data!.newsmovieadvance == null) {
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
          FutureBuilder<TrendingMoviesModel>(
            future: compute(fetchtrendingmovieIsolate, trendingMovieController),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return buildShimmerEffect();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData ||
                  snapshot.data!.trendingmovies == null) {
                return Center(child: Text('No data available'));
              } else {
                return buildCategorySection(
                  context,
                  title: 'Trending Movies',
                  trendingMoviesModel: snapshot.data!.trendingmovies,
                  onTap: () {
                    Get.to(() => TrendingMovieView());
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

  //Trending Movies
  static Future<TrendingMoviesModel> fetchtrendingmovieIsolate(
      TrendingMovieController trendingMovieController) async {
    return await trendingMovieController.fetchtrendingmovies();
  }

  Widget buildCategorySection(
  BuildContext context, {
  required String title,
  List<TVShowItem>? shows,
  List<NewsMovieAdvance>? newsMovieAdvance,
  List<TrendingMoviesSecond>? trendingMoviesModel,
  required VoidCallback onTap,
}) {
  const String fallbackImageUrl =
      'https://media.printables.com/media/prints/720099/images/5642382_ff7f56f6-6039-407e-a66b-b869f1ef4be4_ea8bc795-5893-4afe-92c1-69755e3d37d2/thumbs/inside/1280x960/png/netflixn3d.webp';
  const String fallbackAssetImage = 'assets/download.jpg';

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
          itemCount: shows?.length ??
              newsMovieAdvance?.length ??
              trendingMoviesModel?.length ??
              0,
          itemBuilder: (context, index) {
            if (shows != null) {
              var show = shows[index].shows?.first;
              return Container(
                width: 140,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    show?.image?.isNotEmpty == true ? show!.image! : fallbackImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(fallbackAssetImage, fit: BoxFit.cover);
                    },
                  ),
                ),
              );
            } else if (newsMovieAdvance != null) {
              var newsMovieAdvancenew = newsMovieAdvance[index];
              return Container(
                width: 140,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    newsMovieAdvancenew.image?.isNotEmpty == true
                        ? newsMovieAdvancenew.image!
                        : fallbackImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(fallbackAssetImage, fit: BoxFit.cover);
                    },
                  ),
                ),
              );
            } else if (trendingMoviesModel != null) {
              var trendingMoviesModelextra = trendingMoviesModel[index];
              return Container(
                width: 140,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    trendingMoviesModelextra.image?.isNotEmpty == true
                        ? trendingMoviesModelextra.image!
                        : fallbackImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(fallbackAssetImage, fit: BoxFit.cover);
                    },
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
