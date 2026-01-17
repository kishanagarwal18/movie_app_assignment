import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class FavouritesProvider extends ChangeNotifier {
  final List<Movie> favourites = [];

  void toggle(Movie movie) {
    if (favourites.any((m) => m.id == movie.id)) {
      favourites.removeWhere((m) => m.id == movie.id);
    } else {
      favourites.add(movie);
    }
    notifyListeners();
  }
}
