import 'package:flutter/material.dart';
import 'package:pokedex/helpers/pokemon_type_helper.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  final Function onPressed;

  const PokemonCard({
    Key key,
    this.pokemon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          // color: PokemonHelper.getColor(pokemon.type1),
          color: PokemonTypeHelper.getColor(pokemon.type1),
          boxShadow: [
            BoxShadow(
              color: PokemonTypeHelper.getColor(pokemon.type1).withOpacity(0.5),
              blurRadius: 5.0,
              offset: Offset(3, 2),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              pokemon.type2 != null
                  ? PokemonTypeHelper.getColor(pokemon.type2)
                  : Colors.cyan,
              PokemonTypeHelper.getColor(pokemon.type1),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                pokemon.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              pokemon.name
                  .replaceFirst(pokemon.name[0], pokemon.name[0].toUpperCase()),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
