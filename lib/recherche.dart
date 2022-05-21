import 'package:flutter/material.dart';
import 'package:flutter_application_origine2/MyHomePage.dart';
import 'Article.dart';
import 'Article.providers.dart';
import 'package:provider/provider.dart';
import 'details.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchterms = ['txt', 'orange ', 'rouge ', 'poi'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  Widget buildResults(BuildContext context) {
    List<Article> matchqery = [];

    for (var fruit in Provider.of<ArticleProviders>(context).produits) {
      matchqery = Provider.of<ArticleProviders>(context).searchItems(query);

      // if (fruit.toLowerCase().contains(query.toLowerCase())) {
      //   matchqery.add(fruit);
      // }
    }
    return ListView.builder(
        itemBuilder: (context, int index) {
          var resultat = matchqery[index];
          return ListTile(
            title: Text(resultat.nom),
          );
        },
        itemCount: matchqery.length);
  }

  Widget buildSuggestions(BuildContext context) {
    List<Article> matchqery = [];
    matchqery = Provider.of<ArticleProviders>(context).searchItems(query);

    for (var fruit in searchterms) {
      //
      matchqery = Provider.of<ArticleProviders>(context).searchItems(query);
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GridView.builder(
          itemCount: matchqery.length,
          itemBuilder: (_, index) {
            return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detailscreen(
                              produit: matchqery[index],
                            ))),
                child: Container(
                  height: 500,
                  width: 400,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.transparent),
                  child: Column(
                    children: [
                      Container(
                        height: 155,
                        width: 200,
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      matchqery[index].imageUrlm))),
                        ),
                      ),
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Column(children: [
                            Text(matchqery[index].nom,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            Text(
                              matchqery[index].prix.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.left,
                            )
                          ]))
                    ],
                  ),
                ));
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          )),
    );
  }
}
