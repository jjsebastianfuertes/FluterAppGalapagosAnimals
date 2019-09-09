import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'package:galapagos_species/screens/animal_screen.dart';
import 'package:galapagos_species/screens/filter_screen.dart';
import 'package:galapagos_species/screens/tabs_screen.dart';
import './screens/island_screen.dart';
import './screens/animal_detail_screen.dart';
import './models/animal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'endemic': false,
    'marine': false,
    'summer': false,
  };

  List<Animal> _availableAnimal = ANIMAL_DATA;
  List<Animal> _favoriteAnimals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableAnimal = ANIMAL_DATA.where((animal) {
        if (_filters['endemic'] && !animal.isEndemic) {
          return false;
        }
        if (_filters['marine'] && !animal.isMarine) {
          return false;
        }
        if (_filters['summer'] && !animal.isSummer) {
          return false;
        }
        return true; //if filters do not match return everything true
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galapagos Species',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigoAccent,
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Colors.black),
              body2: TextStyle(color: Colors.black),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto-slab',
                  color: Color.fromRGBO(255, 195, 0, 1),
                  fontWeight: FontWeight.bold),
              caption: TextStyle(
                color: Color.fromRGBO(255, 87, 51, 1),
              ),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TabScreen(_favoriteAnimals),
        CategoryIslandScreen.routeName: (context) =>
            CategoryIslandScreen(_availableAnimal),
        AnimalDetailScreen.routeName: (context) => AnimalDetailScreen(),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
      },
      //when the route choose has not been defined
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
