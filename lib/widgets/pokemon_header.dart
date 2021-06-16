import 'package:flutter/material.dart';
import 'package:pokedex/widgets/rotation_widget.dart';

class PokemonHeader extends StatelessWidget {
  final String imageUrl;
  final Color backgroundColor;

  const PokemonHeader({
    Key key,
    this.imageUrl,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.width * 0.6,
      color: backgroundColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: RotationPokeballImage(
              child: Image.asset(
                "lib/assets/logo/pokeball-2.png",
                fit: BoxFit.fitHeight,
                color: Theme.of(context).backgroundColor.withOpacity(0.6),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.width * 0.15,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.width * 0.5,
              width: size.width,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
