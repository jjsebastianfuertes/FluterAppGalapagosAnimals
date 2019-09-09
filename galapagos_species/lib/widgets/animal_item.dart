import 'package:flutter/material.dart';
import 'package:galapagos_species/models/animal.dart';
import '../screens/animal_detail_screen.dart';

class AnimalItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String scintificName;
  final Status status;
  final Function removeItem;

  AnimalItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.description,
    @required this.status,
    @required this.scintificName,
    @required this.removeItem,
  });

  void selectedAnimal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AnimalDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  //works only with Stack widget... takes relation of the biggest child
                  bottom: 20,
                  right: 10,
                  child: Container(
                    //this container is needed, so the text does not get crop
                    width: 250,
                    child: Text(
                      title,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        // to add shadows to the text use the widget above
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      softWrap: true,
                      overflow: TextOverflow
                          .fade, //the text will be fade out if it is too long [safety]
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.chrome_reader_mode,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 10),
                      Text('$scintificName'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_searching,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 10),
                      Text('$status'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => selectedAnimal(context),
    );
  }
}
