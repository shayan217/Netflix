import 'package:augmented_reality/celebrities_news/celebrities_news_card.dart';
import 'package:augmented_reality/celebrities_news/controller.dart';
import 'package:augmented_reality/celebrities_news/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
class CelebritiesNews extends StatelessWidget {
  final CelebritiesNewsController celebritiesNewsController = Get.put(CelebritiesNewsController());

  CelebritiesNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Celebrities News', style: GoogleFonts.montserrat(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 255, 4, 4),
      ),
      body: FutureBuilder<List<Newsof>>(
        future: celebritiesNewsController.fetchCelebritiesNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmer();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          } else {
            List<Newsof> uniqueNews = snapshot.data!.toSet().toList(); // Ensure uniqueness
            return ListView.builder(
              itemCount: uniqueNews.length,
              itemBuilder: (context, index) {
                Newsof newsItem = uniqueNews[index];
                return CelebritiesNewsCard(news: newsItem);
              },
            );
          }
        },
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildShimmer() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Shimmer.fromColors(
        baseColor: Colors.black38,
        highlightColor: Colors.grey,
        child: Column(
          children: [
            _shimmerContainer(25),
            const SizedBox(height: 20),
            _shimmerContainer(200),
            const SizedBox(height: 20),
            _shimmerContainer(100),
          ],
        ),
      ),
    );
  }

  Widget _shimmerContainer(double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height,
        color: Colors.white,
      ),
    );
  }
}
