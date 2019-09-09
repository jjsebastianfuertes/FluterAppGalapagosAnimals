import 'package:flutter/material.dart';
import '../screens/animal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem(this.id, this.title, this.imageUrl);

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryIslandScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () {
            SelectCategory(context);
          },
          splashColor: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          // splashColor: Theme.of(context).primaryColor,
          // borderRadius: BorderRadius.circular(15),
          // child: Container(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text(
          //       title,
          //       style: Theme.of(context).textTheme.title,
          //     ),
          //   ),
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight,
          //         colors: [color.withOpacity(0.4), color],
          //       ),
          //       borderRadius: BorderRadius.circular(15)),
          // ),
          ),
    );
  }
}
