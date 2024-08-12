import 'package:augmented_reality/movies_news/movie_news_card.dart';
import 'package:augmented_reality/movies_news/movie_news_controller.dart';
import 'package:augmented_reality/movies_news/movie_news_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
class MovieNewsViewAdvance extends StatelessWidget {
  MovieNewsAdvanceController movieNewsAdvanceController =
      Get.put(MovieNewsAdvanceController());
  MovieNewsViewAdvance({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text('Movies News', style: GoogleFonts.montserrat(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 255, 4, 4),
      ),
      body: FutureBuilder<MoviesNewsAdvance>(
  future: movieNewsAdvanceController.fetchmovienewsadvance(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Padding(
              padding: const EdgeInsets.all(10),
              child: Shimmer.fromColors(
                baseColor: Colors.black38,
                highlightColor: Colors.grey,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 200,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 100,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(''),
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 200,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 100,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(''),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (snapshot.data == null || snapshot.data!.newsmovieadvance == null || snapshot.data!.newsmovieadvance!.isEmpty) {
      return Center(child: Text('No Top Box found'));
    } else {
      return ListView.builder(
        itemCount: snapshot.data!.newsmovieadvance!.length,
        itemBuilder: (context, index) {
          NewsMovieAdvance newsMovieAdvance = snapshot.data!.newsmovieadvance![index];
          return MovieNewsCardAdvance(newsMovieAdvance: newsMovieAdvance);
        },
      );
    }
  },
),
      backgroundColor: Colors.black,
    );
  }
}