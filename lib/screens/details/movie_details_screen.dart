import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../models/movie_model.dart';
import '../../core/constants/api_constants.dart';
import '../../core/services/notification_service.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "${ApiConstants.imageBaseUrl}${movie.poster}",
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(movie.overview),
                  const SizedBox(height: 15),
                  Text("Release Date: ${movie.releaseDate}"),
                  const SizedBox(height: 20),
                  CircularPercentIndicator(
                    radius: 60,
                    percent: movie.rating / 10,
                    center: Text("${movie.rating}"),
                    progressColor: Colors.green,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        NotificationService.show("Movie is Playing");
                      },
                      child: const Text("Play Now"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
