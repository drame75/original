import 'package:flutter/material.dart';
import 'package:flutter_application_origine2/favorite.dart';
import 'MyHomePage.dart';
import 'package:provider/provider.dart';
import 'Article.providers.dart';
import 'package:flutter/services.dart';
import 'mapScreen.dart';

  
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ArticleProviders())
    ],
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const home(),
    );
  }
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final PageStorageBucket bucket = PageStorageBucket();
  Widget CurrentScreen = MyHomePage();
  List<String> listOfString = ['Home', 'Favories', 'Setting', 'Account'];
  List<IconData> listOfIcon = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded
  ];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: PageStorage(bucket: bucket, child: CurrentScreen),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(displayWidth * .05),
          height: displayWidth * .07,
          decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    offset: const Offset(0, 10))
              ],
              borderRadius: BorderRadius.circular(50)),
          child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        HapticFeedback.lightImpact();
                        switch (index) {
                          case 0:
                            CurrentScreen = const MyHomePage();
                            break;
                          case 1:
                            CurrentScreen = favoritePage(
                                favoriteListe: Provider.of<ArticleProviders>(
                                        context,
                                        listen: false)
                                    .fav());
                            break;
                          case 2:
                            CurrentScreen = mapScreen();
                            break;
                        }
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex
                              ? displayWidth * .32
                              : displayWidth * .18,
                          alignment: Alignment.center,
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            height:
                                index == currentIndex ? displayWidth * .12 : 0,
                            width:
                                index == currentIndex ? displayWidth * .32 : 0,
                            decoration: BoxDecoration(
                                color: index == currentIndex
                                    ? Colors.blueAccent.withOpacity(.2)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? displayWidth * .31
                                : displayWidth * .18,
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      width: index == currentIndex
                                          ? displayWidth * .13
                                          : 0,
                                    ),
                                    AnimatedOpacity(
                                      opacity: index == currentIndex ? 1 : 0,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: Text(
                                        index == currentIndex
                                            ? '${listOfString[index]}'
                                            : '',
                                        style: const TextStyle(
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      width: index == currentIndex
                                          ? displayWidth * .03
                                          : 20,
                                    ),
                                    Icon(
                                      listOfIcon[index],
                                      size: displayWidth * .050,
                                      color: index == currentIndex
                                          ? Colors.blueAccent
                                          : Colors.black26,
                                    )
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  )),
        ));
  }
}
