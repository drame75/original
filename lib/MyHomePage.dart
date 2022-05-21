import 'package:flutter/material.dart';
import 'recherche.dart';
import 'Article.providers.dart';
import 'package:provider/provider.dart';
import 'details.dart';


enum categorie { homme, femme, enfant }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool isFavorite = false;
  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  categorie choix = categorie.homme;

  @override
  Widget build(BuildContext context) {
    setState(() {
      Provider.of<ArticleProviders>(context).pro(choix);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
           Text('Original',
              style: TextStyle(color: Colors.black.withOpacity(0.9), fontSize: 40)),
          Container(
            alignment: Alignment.bottomRight,
            height: 55,
            child: IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                )),
            // child: TextField(
            //   decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(50),
            //           borderSide:
            //               const BorderSide(color: Colors.transparent, width: 0)),
            //       filled: true,
            //       fillColor: Colors.grey,
            //       hintText: 'Recherche'),
            //   onTap: () {
            //     showSearch(
            //       context: context,
            //       delegate: CustomSearchDelegate(),
            //     );
            //   },
            // ),
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          Row(
            children: const [
              Text('Filtrer',
                  style: TextStyle(color: Colors.blue, fontSize: 20)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: TabBar(
              controller: _tabController,
              isScrollable: false,
              labelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              tabs: const [
                Tab(
                  text: 'HOMME',
                ),
                Tab(text: 'FEMME'),
                Tab(text: 'ENFANT'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              cat(c: categorie.homme),
              cat(c: categorie.femme),
              cat(c: categorie.enfant)
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class cat extends StatefulWidget {
  cat({Key? key, required this.c}) : super(key: key);
  categorie c;

  @override
  State<cat> createState() => _catState();
}

class _catState extends State<cat> {
  Color Mycolor = Color(0xFF3B3937);

  @override
  Widget build(BuildContext context) {
    if (widget.c == categorie.enfant) {
      setState(() {
        Mycolor = Colors.green;
      });
    }
    if (widget.c == categorie.homme) {
      Mycolor = Colors.blue;
    }
    if (widget.c == categorie.femme) {
      Mycolor = Colors.pink;
    }
    return GridView.builder(
        itemCount: Provider.of<ArticleProviders>(context).pro(widget.c).length,
        itemBuilder: (_, index) {
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => detailscreen(
                            produit: Provider.of<ArticleProviders>(context)
                                .pro(widget.c)[index],
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
                      decoration: BoxDecoration(color: Mycolor),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    Provider.of<ArticleProviders>(context)
                                        .pro(widget.c)[index]
                                        .imageUrlm))),
                        child: IconButton(
                          icon: Provider.of<ArticleProviders>(context,
                                      listen: false)
                                  .pro(widget.c)[index]
                                  .isFavorite
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          color: Colors.red,
                          onPressed: () {
                            Provider.of<ArticleProviders>(context,
                                    listen: false)
                                .like(Provider.of<ArticleProviders>(context,
                                        listen: false)
                                    .pro(widget.c)[index]);
                          },
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomLeft,
                        child: Column(children: [
                          Text(
                              Provider.of<ArticleProviders>(context)
                                  .pro(widget.c)[index]
                                  .nom,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20)),
                          Text(
                            Provider.of<ArticleProviders>(context)
                                .pro(widget.c)[index]
                                .prix
                                .toString(),
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
        ));
  }
}
