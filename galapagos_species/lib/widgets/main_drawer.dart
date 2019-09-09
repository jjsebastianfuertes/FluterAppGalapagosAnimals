import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon, Function taphandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Roboto-slab',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: taphandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.only(top: 30, left: 30),
            alignment: Alignment.centerLeft, //aligns the child of the container
            child: Text(
              'Animales',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          buildListTitle('Animales', Icons.nature, () {
            Navigator.of(context).pushReplacementNamed(
                '/'); //pushReplacementName put a new page, not put it over
          }),
          buildListTitle('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
