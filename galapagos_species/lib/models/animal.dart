import 'package:flutter/foundation.dart';

enum Status {
  Extinct,
  ExtinctInTheWild,
  CriticallyEndangered,
  Endangered,
  Vulnerable,
  NearThreatened,
  LeastConcern,
  DataDeficient,
  NotEvaluated
}

class Animal {
  final String id;
  final List<String> categories; //islands that have this animal
  final String title;
  final String scintificName;
  final String imageUrl;
  final String description;
  final List<String> food;
  final List<String> predators;
  final Status status;

  final bool isEndemic;
  final bool isMarine; // it is a marine animal or land animal
  final bool isSummer; //it is visible during summer or winter sesson

  const Animal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.scintificName,
      @required this.imageUrl,
      @required this.description,
      @required this.food,
      @required this.predators,
      @required this.status,
      @required this.isEndemic,
      @required this.isMarine,
      @required this.isSummer});
}
