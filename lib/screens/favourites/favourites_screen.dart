import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/favourites_provider.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favs = context.watch<FavouritesProvider>().favourites;

    return Scaffold(
      appBar: AppBar(title: const Text("Favourites")),
      body: favs.isEmpty
          ? const Center(child: Text("No favourites added"))
          : ListView(
              children:
                  favs.map((m) => ListTile(title: Text(m.title))).toList(),
            ),
    );
  }
}
