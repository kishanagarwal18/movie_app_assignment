import 'package:flutter/material.dart';
import '../movies/movies_screen.dart';
import '../favourites/favourites_screen.dart';
import '../watchlist/watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final screens = [
    MoviesScreen(),
    FavouritesScreen(),
    WatchlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movies",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Watchlist",
          ),
        ],
      ),
    );
  }
}
