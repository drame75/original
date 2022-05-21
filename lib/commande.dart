import 'package:flutter/material.dart';
import 'Article.dart';
import 'Article.providers.dart';
import 'package:provider/provider.dart';
import 'details.dart';


class commande extends StatefulWidget {
  commande({Key? key, required this.commandeList}) : super(key: key);
  List<Article> commandeList;
  @override
  State<commande> createState() => _commandeState();
}

class _commandeState extends State<commande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('commande',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold))),
      body: ListView.builder(
          itemCount:
              (widget.commandeList == null) ? 0 : widget.commandeList.length,
          itemBuilder: (BuildContext context, int index) {
            Article comm = Provider.of<ArticleProviders>(context)
                .pc(widget.commandeList[index]);

            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => detailscreen(
                            produit: widget.commandeList[index],
                          ))),
              child: Dismissible(
                  key: Key(comm.nom),
                  onDismissed: (direction) {
                    setState(() {
                      widget.commandeList.removeAt(index);
                      if (!widget.commandeList.isEmpty) {
                        comm.isFavorite = false;
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${comm.nom} supprimé")));
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
                                            .commandeList[index].imageUrlm))))),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                widget.commandeList[index].nom,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )),
                              Text(
                                widget.commandeList[index].description,
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
