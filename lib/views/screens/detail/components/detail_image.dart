import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final String image;
  const DetailImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 500,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
          ),
          Center(
            child: Image.network(
              image,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
