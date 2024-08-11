import 'dart:math';
import 'package:augmented_reality/celebrities_news/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
class CelebritiesNewsCard extends StatelessWidget {
  final Newsof news;
  const CelebritiesNewsCard({required this.news});
  @override
  Widget build(BuildContext context) {
    List<String> defaultImages = [
      'assets/download.jpg',
      'assets/download2.jpg',
      'assets/download3.jpg',
    ];
    bool isImageFromApiAvailable = news.image?.isNotEmpty == true;
    return Card(
      color: Colors.black,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.date ?? '',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(12),
                //   child: Image.network(
                //     news.image ?? '',
                //     fit: BoxFit.cover,
                //     width: double.infinity,
                //     height: 220,
                //   ),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: isImageFromApiAvailable
                      ? Image.network(
                          news.image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 220,
                        )
                      : Image.asset(
                          defaultImages[Random().nextInt(defaultImages.length)],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 220,
                        ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.9),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      news.title ?? '',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'SOURCE: ${news.source}'.toUpperCase(),
                style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white60),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                'CATEGORIES: ${news.writer}'.toUpperCase(),
                style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white60),
                softWrap: true,
            textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'DESCRIPTION: ${news.description}'.toUpperCase(),
              style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white60),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 4, 4),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _launchUrl(news.link ?? '');
                },
                child: Text(
                  'WATCH NOW',
                  style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Divider(color: Colors.grey[800]),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(String link) async {
    final Uri _url = Uri.parse(link);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}