import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/watchlist_provider.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final watchlist = context.watch<WatchlistProvider>().watchlist;

    return Scaffold(
      appBar: AppBar(title: const Text("Watchlist")),
      body: watchlist.isEmpty
          ? const Center(child: Text("No movies in watchlist"))
          : ListView(
              children:
                  watchlist.map((m) => ListTile(title: Text(m.title))).toList(),
            ),
    );
  }
}
