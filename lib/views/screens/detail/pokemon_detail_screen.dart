import 'package:flutter/material.dart';
import 'package:flutter_formation/state/favorites_state.dart';
import 'package:flutter_formation/state/pokemon_detail.dart';
import 'package:flutter_formation/views/screens/detail/components/pokemon_detail_widget.dart';
import 'package:flutter_formation/views/widgets/header_bar.dart';
import 'package:provider/provider.dart';

import 'package:flutter_formation/core/strings.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final detailState = Provider.of<PokemonDetailState>(context);

    return Scaffold(
      appBar: HeaderBar(
        title: Strings.detailScreenTitle,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            detailState.loading
                ? CircularProgressIndicator()
                : detailState.error != null
                    ? Text("Une erreur est survenue !")
                    : detailState.detail != null
                        ? PokemonDetailWidget(
                              detail: detailState.detail!,
                          ) : Text("Pas d'information !"),
          ],
        ),
      ),
    );
  }
}
