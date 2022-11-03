import 'package:api_call_flutter/provider/favorite_provider.dart';
import 'package:api_call_flutter/provider/pages/favorite_Screen.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final word = nouns.take(50).toList();
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider state Management'),
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
          onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Favoritewords())),

          label: Text('Favorite'),
        ));
  }
}
