import 'package:flutter/material.dart';
import 'Article.dart';
import 'Article.providers.dart';
import 'package:provider/provider.dart';

class detailscreen extends StatefulWidget {
  detailscreen({required this.produit});

  final Article produit;

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class selectColors extends StatelessWidget {
  const selectColors({Key? key, this.Colors}) : super(key: key);
  final Colors;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration:
          BoxDecoration(color: Colors, borderRadius: BorderRadius.circular(30)),
    );
  }
}

class _detailscreenState extends State<detailscreen> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   title: Text(
        //     widget.produit.nom,
        //     style: const TextStyle(color: Colors.white),
        //   ),
        // ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.produit.imageUrlm))),
              )),
              Positioned(
                height: 60,
                left: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.amber,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                top: 280,
                child: Container(
                    alignment: Alignment.bottomLeft,
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.produit.nom,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 30),
                            ),
                            Text(
                              widget.produit.prix.toString(),
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 30),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text('Description : ',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.9),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          children: [
                            Text(widget.produit.description,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'choisissez la quantité',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.produit.nbr--;
                                });
                              },
                              child: Container(
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(9)),
                                  child: const Center(
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.produit.nbr.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.produit.nbr++;
                                });
                              },
                              child: Container(
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(9)),
                                  child: const Center(
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    )),
              )
            ],
          ),
        )
        //
        // SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Column(
        //     children: [
        //       const SizedBox(
        //         height: 30,
        //       ),
        //       Center(
        //         child: Column(children: [
        //           Container(
        //               height: 200,
        //               width: 300,
        //               decoration: const BoxDecoration(color: Colors.transparent),
        //               child: Container(
        //                   decoration: BoxDecoration(
        //                       color: Colors.black,
        //                       borderRadius: BorderRadius.circular(30),
        //                       image: DecorationImage(
        //                           fit: BoxFit.cover,
        //                           image:
        //                               NetworkImage(widget.produit.imageUrlm))))),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           Text(
        //             widget.produit.nom,
        //             style: const TextStyle(color: Colors.white, fontSize: 35),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           Text(
        //             widget.produit.description,
        //             style: const TextStyle(color: Colors.white70, fontSize: 20),
        //             textAlign: TextAlign.center,
        //           ),
        //           Row(
        //             children: [
        //               Text(
        //                 widget.produit.prix.toString(),
        //                 style: const TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 20,
        //                 ),
        //               ),
        //               const Text(
        //                 'XOF',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 20,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ]),
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //         alignment: Alignment.bottomLeft,
        //         child: const Text(
        //           'Choisissez votre couleur',
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       Row(
        //         children: const [
        //           selectColors(
        //             Colors: Colors.white,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           selectColors(
        //             Colors: Colors.red,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           selectColors(
        //             Colors: Colors.lightBlueAccent,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           selectColors(
        //             Colors: Colors.greenAccent,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //         ],
        //       ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       Container(
        //         alignment: Alignment.bottomLeft,
        //         child: const Text(
        //           'choisissez la quantité',
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       InkWell(
        //         onTap: () {
        //           setState(() {
        //             Article pp =
        //                 Provider.of<ArticleProviders>(context, listen: false)
        //                     .pc(widget.produit);
        //             Provider.of<ArticleProviders>(context, listen: false).cd(pp);
        //           });
        //           ScaffoldMessenger.of(
        //             context,
        //           ).showSnackBar(
        //               const SnackBar(content: Text('Commande effectuée')));
        //         },
        //         child: Container(
        //             alignment: Alignment.bottomRight,
        //             height: 40,
        //             width: 100,
        //             decoration: BoxDecoration(
        //                 color: Colors.white54,
        //                 borderRadius: BorderRadius.circular(9)),
        //             child: const Center(
        //               child: Text(
        //                 'Get',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 20,
        //                 ),
        //               ),
        //             )),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}

Widget buildMenuItem(
    {required String text, required IconData icon, VoidCallback? onclicked}) {
  final Color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(
      icon,
      color: Color,
    ),
    title: Text(
      text,
      style: TextStyle(color: Color),
    ),
    hoverColor: hoverColor,
    onTap: onclicked,
  );
}
