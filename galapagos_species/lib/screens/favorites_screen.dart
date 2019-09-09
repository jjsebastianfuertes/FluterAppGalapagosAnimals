import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../widgets/animal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Animal> favoriteAnimals;

  FavoritesScreen(this.favoriteAnimals);

  @override
  Widget build(BuildContext context) {
    if (favoriteAnimals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet...'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return AnimalItem(
            id: favoriteAnimals[index].id,
            title: favoriteAnimals[index].title,
            imageUrl: favoriteAnimals[index].imageUrl,
            description: favoriteAnimals[index].description,
            status: favoriteAnimals[index].status,
            scintificName: favoriteAnimals[index].scintificName,
          );
        },
        itemCount: favoriteAnimals.length,
      );
    }
  }
}
