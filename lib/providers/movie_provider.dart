import 'package:flutter/material.dart';
import '../core/services/api_service.dart';
import '../models/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Movie> movies = [];
  bool isLoading = false;
  String? error;

  Future fetchMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await _apiService.fetchMovies();
      movies = data.map((e) => Movie.fromJson(e)).toList();
      error = null;
    } catch (e) {
      error = "Failed to load movies";
    }

    isLoading = false;
    notifyListeners();
  }
}
