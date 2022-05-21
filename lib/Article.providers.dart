import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


import 'Article.dart';
import 'MyHomePage.dart';

class ArticleProviders with ChangeNotifier {
  List<Article> produits = [
    Article(
        nom: "Zetrie",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToflyhVpyz1PrHEQxucV75akadkQW3QeoXfQ&usqp=CAU',
        description: "chaussure relaxe",
        prix: 15000,
        type: Type.homme,
        isFavorite: true,
        isCommande: true,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "Marque Tega",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg8EhOQ5QbzxDczLmtcifktDod0y78SDI8RA&usqp=CAU',
        description: "habit  class",
        prix: 25000,
        type: Type.homme,
        isFavorite: true,
        isCommande: true,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "c&g",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxftopPxvyH6I-x2VYM95dVCn0dOMPf0HqHw&usqp=CAU',
        description: "habit 100% coton ",
        prix: 75000,
        type: Type.homme,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "Where we go",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI2ILSZ8r0sInOQ76rBcYOY1SaeO_wnQm2mA&usqp=CAU',
        description: " complet original",
        prix: 8500,
        type: Type.femme,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "Megv",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkO-eNOl4e6qEXQ1E48IxPTocLLSujhRHBhA&usqp=CAU',
        description: "Maillot de bain sexy",
        prix: 150000,
        type: Type.femme,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "Zetrie",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWVb3MoaDiOH146yR9Tz8m-552orcOA-l_Ew&usqp=CAU',
        description: "chaussure relaxe",
        prix: 15000,
        type: Type.femme,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "zoom",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY90eKwr6jdEYjvGpTCrvs4Z8BvBSpLL8yMQ&usqp=CAU',
        description: "chaussure relaxe",
        prix: 15000,
        type: Type.enfant,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "blase",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuNRU73a258ILLcVHC5EfwTT2OIxNeusSw3w&usqp=CAU',
        description: " relaxe",
        prix: 17000,
        type: Type.enfant,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "Zoe",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnBVOja6VNokpmJAscBX6rYdE6X-vvC7hVrg&usqp=CAU',
        description: "Propre",
        prix: 29100,
        type: Type.enfant,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "Sauvage",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-MjE4AYWuj8JC4oYZvgQyHPM7O-TIExRbMQ&usqp=CAU',
        description: "parfum homme",
        prix: 15000,
        type: Type.homme,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "BG",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1JeVkeQ-yq7kXbxCEg7-2d2XmvdfJTsDl5Q&usqp=CAU',
        description: "parfum de luxe ",
        prix: 15000,
        type: Type.femme,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "BaBy",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3b1i613Ntco9WfdJscaWcotH63hxBabO0xQ&usqp=CAU',
        description: "chemise ",
        prix: 15000,
        type: Type.enfant,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "Seven 7",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDSzjWRO1-oas0XfaN_oBJwQEl5XTzqdgBiQ&usqp=CAU',
        description: " chemise de luxe ",
        prix: 15000,
        type: Type.homme,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "Bb",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7GYub6PGpgLfUrwU6hYru32dSkmppyUsF_w&usqp=CAU',
        description: "100% naturel",
        prix: 15000,
        type: Type.femme,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
    Article(
        nom: "Vega",
        imageUrlm:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIEl2iez9eb4i6xu7weISyCQ_j49f5ej_7Gg&usqp=CAU',
        description: " produit de Luxe",
        prix: 15000,
        type: Type.enfant,
        isFavorite: false,
        isCommande: false,
        id: DateTime.now().toString(),
        nbr: 1),
  ];

  List<Article> pro(categorie t) {
    List<Article> cc = [];

    if (t == categorie.homme) {
      cc = produits.where((element) => element.type == Type.homme).toList();
    }
    if (t == categorie.femme) {
      cc = produits.where((element) => element.type == Type.femme).toList();
    }
    if (t == categorie.enfant) {
      cc = produits.where((element) => element.type == Type.enfant).toList();
    }

    return cc;
  }

  List<Article> com() =>
      produits.where((element) => element.isCommande == true).toList();

      


  List<Article> fav() =>
      produits.where((element) => element.isFavorite == true).toList();

  Article pc(Article art) {
    return produits.where((element) => element.id == art.id).single;
  }

  void cd(Article art) {
    art.isCommande = true;
    notifyListeners();
  }
  void lik(Article art) {
    art.isFavorite = true;
    notifyListeners();
  }
  void like(Article art) {
    art.isFavorite = !art.isFavorite;
    notifyListeners();
  }

  List<Article> searchItems(String name) {
    if ((name.isNotEmpty) && (name != "")) {
      return [
        ...produits
            .where((prosItem) =>
                prosItem.nom.toLowerCase().startsWith(name.toLowerCase()))
            .toList()
      ];
    }
    return [...produits];
  }

}
