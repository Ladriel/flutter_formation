import 'package:flutter/material.dart';
import 'package:flutter_formation/data/models/pokedex_entry.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  List<PokedexEntry> entries = <PokedexEntry>[
    PokedexEntry(name: "Bulbizarre", number: 1, sprite: "1.png"),
    PokedexEntry(name: "Salamèche", number: 4, sprite: "4.png"),
    PokedexEntry(name: "Carapuce", number: 7, sprite: "7.png"),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: entries
                  .map(
                    (entry) => SizedBox(
                      height: 60,
                      child: Card(
                        color: theme.colorScheme.background,
                        child: Center(
                          child: Text(
                            entry.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: theme.colorScheme.onBackground,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
