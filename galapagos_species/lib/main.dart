import 'package:flutter/material.dart';
import 'package:galapagos_species/screens/animal_screen.dart';
import 'package:galapagos_species/screens/filter_screen.dart';
import 'package:galapagos_species/screens/tabs_screen.dart';
import './screens/island_screen.dart';
import './screens/animal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/': (context) => TabScreen(),
        CategoryIslandScreen.routeName: (context) => CategoryIslandScreen(),
        AnimalDetailScreen.routeName: (context) => AnimalDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
      //when the route choose has not been defined
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
