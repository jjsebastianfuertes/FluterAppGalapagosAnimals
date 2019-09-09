import 'package:flutter/material.dart';
import '../widgets/animal_item.dart';
import '../models/animal.dart';

class CategoryIslandScreen extends StatefulWidget {
  //route variable name
  static const routeName = '/categories-island';

  final List<Animal> availableAnimal;

  CategoryIslandScreen(this.availableAnimal);

  @override
  _CategoryIslandScreenState createState() => _CategoryIslandScreenState();
}

class _CategoryIslandScreenState extends State<CategoryIslandScreen> {
  String categoryTitle;
  List<Animal> displayedAnimals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      // setting arguments recibed form category_item as variables

      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      //conect island id with animal categories id
      displayedAnimals = widget.availableAnimal.where((animal) {
        return animal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  // void _removeAnimal(String animalId) {
  //   setState(() {
  //     displayedAnimals.removeWhere(
  //         (animal) => animal.id == animalId); //delete animal removed
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return AnimalItem(
            id: displayedAnimals[index].id,
            title: displayedAnimals[index].title,
            imageUrl: displayedAnimals[index].imageUrl,
            description: displayedAnimals[index].description,
            status: displayedAnimals[index].status,
            scintificName: displayedAnimals[index].scintificName,
          );
        },
        itemCount: displayedAnimals.length,
      ),
    );
  }
}
