import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/movie_provider.dart';
import '../../widgets/movie_card.dart';

class MoviesScreen extends StatefulWidget {
  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  String query = "";

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieProvider>().fetchMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search movies...",
                filled: true,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => query = value.toLowerCase());
              },
            ),
          ),
        ),
      ),
      body: Consumer<MovieProvider>(
        builder: (_, provider, __) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          final movies = provider.movies
              .where((m) => m.title.toLowerCase().contains(query))
              .toList();

          if (movies.isEmpty) {
            return const Center(child: Text("No movies found"));
          }

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, i) => MovieCard(movie: movies[i]),
          );
        },
      ),
    );
  }
}
