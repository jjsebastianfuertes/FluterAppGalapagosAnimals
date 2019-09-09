import 'package:flutter/material.dart';
import '../dummy_data.dart';

class AnimalDetailScreen extends StatelessWidget {
  static const routeName = './animal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  AnimalDetailScreen(this.toggleFavorite, this.isFavorite);

//widget of the titles of the cards
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

//widget of the content for the titles
  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height - 700,
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgId = ModalRoute.of(context).settings.arguments as String;

//set id imported from animal_item with ANIMAL_DATA id
    final selectedAnimal =
        ANIMAL_DATA.firstWhere((animal) => animal.id == routeArgId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedAnimal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedAnimal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Predadores'),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.indigoAccent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    child: Text(selectedAnimal.predators[index]),
                  ),
                ),
                itemCount: selectedAnimal.predators.length,
              ),
            ),
            buildSectionTitle(context, 'Alimento'),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.indigoAccent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    child: Text(selectedAnimal.food[index]),
                  ),
                ),
                itemCount: selectedAnimal.food.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          //check if the id (animal) has been selected true or false
          isFavorite(routeArgId) ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () => toggleFavorite(routeArgId),
      ),
    );
  }
}
