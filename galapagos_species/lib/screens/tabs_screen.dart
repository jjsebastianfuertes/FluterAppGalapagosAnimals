import 'package:flutter/material.dart';
import '../models/animal.dart';
import 'package:galapagos_species/screens/favorites_screen.dart';
import 'package:galapagos_species/screens/island_screen.dart';
import 'package:galapagos_species/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  //list create in main.dart
  final List<Animal> favoriteAnimals;
  TabScreen(this.favoriteAnimals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    // included in initState because widget or any property
    // option is not available if the list is not compleatly initialazed
    _pages = [
      CategoriesScreen(),
      FavoritesScreen(widget.favoriteAnimals),
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galapagos Species'),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Colors.white,
        currentIndex:
            _selectedPageIndex, //must be to change unselectedItemColor and SelectedItemColor
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Islands'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
