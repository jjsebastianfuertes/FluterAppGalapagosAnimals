import 'package:flutter/material.dart';
import '../models/animal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Animal> favoriteAnimals;

  FavoritesScreen(this.favoriteAnimals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('favorites'),
    );
  }
}
