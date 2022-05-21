

import 'package:flutter/material.dart';

enum Type { enfant, homme, femme }

class Article {
  String nom;
  String id;
  String imageUrlm;
  String description;
  int prix;
  Type type;
  bool isFavorite;
  bool isCommande;
  int nbr;

  Article(
      {required this.nom,
      required this.nbr,
      required this.id,
      required this.isFavorite,
      required this.imageUrlm,
      required this.description,
      required this.type,
      required this.isCommande,
      required this.prix});
}
