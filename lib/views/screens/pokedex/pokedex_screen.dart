import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_formation/state/pokedex_state.dart';
import 'package:flutter_formation/core/strings.dart';
import 'components/pokedex_grid.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pokedexState = Provider.of<PokedexState>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          pokedexState.loading
              ? CircularProgressIndicator()
              : pokedexState.error != null
                  ? Text(Strings.error)
                  : pokedexState.entries != null
                      ? Expanded(
                        child: PokedexGrid(
                            entries: pokedexState.entries!,
                          ),
                      )
                      : Text(Strings.empty),
        ],
      ),
    );
  }
}
