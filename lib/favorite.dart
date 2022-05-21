import 'package:flutter/material.dart';
import 'Article.dart';
import 'Article.providers.dart';
import 'package:provider/provider.dart';
import 'details.dart';

class favoritePage extends StatefulWidget {
  favoritePage({Key? key, required this.favoriteListe}) : super(key: key);
  List<Article> favoriteListe;
  @override
  State<favoritePage> createState() => _favoritePageState();
}

class _favoritePageState extends State<favoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Favorite',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold))),
      body: ListView.builder(
          itemCount: widget.favoriteListe.length,
          itemBuilder: (BuildContext context, int index) {
            Article fav = Provider.of<ArticleProviders>(context)
                .pc(widget.favoriteListe[index]);
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => detailscreen(
                            produit: widget.favoriteListe[index],
                          ))),
              child: Dismissible(  
                  key: Key(fav.nom),
                  onDismissed: (direction) {
                    setState(() {
                      widget.favoriteListe.removeAt(index);
                      Provider.of<ArticleProviders>(context, listen: false)
                          .like(fav);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${fav.nom} supprimé")));
                  },
                  background: Container(
                    
                    color: Colors.red,
                  ),
                  child: Card(
                    color: Colors.grey[500],
                    elevation: 10,
                    child: Row(
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(widget
                                            .favoriteListe[index]
                                            .imageUrlm))))),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Container(
                                  child: Text(
                                widget.favoriteListe[index].nom,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )),
                              Text(
                                widget.favoriteListe[index].description,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
