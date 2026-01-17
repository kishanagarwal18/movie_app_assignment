import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/movie_model.dart';
import '../providers/favourites_provider.dart';
import '../providers/watchlist_provider.dart';
import '../screens/details/movie_details_screen.dart';
import '../core/constants/api_constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    final favProvider = context.watch<FavouritesProvider>();
    final watchProvider = context.watch<WatchlistProvider>();

    final isFav = favProvider.favourites.any((m) => m.id == movie.id);
    final isWatch = watchProvider.watchlist.any((m) => m.id == movie.id);

    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: "${ApiConstants.imageBaseUrl}${movie.poster}",
          width: 50,
          placeholder: (_, __) => const CircularProgressIndicator(),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
        ),
        title: Text(movie.title),
        subtitle: Text("Rating: ${movie.rating}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : null,
              ),
              onPressed: () {
                favProvider.toggle(movie);
              },
            ),
            IconButton(
              icon: Icon(
                isWatch ? Icons.bookmark : Icons.bookmark_border,
                color: isWatch ? Colors.blue : null,
              ),
              onPressed: () {
                watchProvider.toggle(movie);
              },
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MovieDetailsScreen(movie: movie),
            ),
          );
        },
      ),
    );
  }
}
