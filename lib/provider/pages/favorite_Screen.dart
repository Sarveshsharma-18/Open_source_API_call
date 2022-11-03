import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../favorite_provider.dart';

class Favoritewords extends StatelessWidget {
  const Favoritewords({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final word = provider.words;
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoriteWords'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final words = word[index];
          return ListTile(
              title: Text(words),
              trailing: IconButton(
                  onPressed: () {
                    provider.toggleFavorite(words);
                  },
                  icon: provider.isExist(words)
                      ? const Icon(
                          Icons.done,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border)));
        },
        itemCount: word.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            provider.clearFavorite();
          },
          label: Text('clear')),
    );
  }
}
