import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class WatchlistProvider extends ChangeNotifier {
  final List<Movie> watchlist = [];

  void toggle(Movie movie) {
    if (watchlist.any((m) => m.id == movie.id)) {
      watchlist.removeWhere((m) => m.id == movie.id);
    } else {
      watchlist.add(movie);
    }
    notifyListeners();
  }
}
