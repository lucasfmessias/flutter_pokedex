import 'package:flutter/material.dart';

class PokemonHelper {
  const PokemonHelper._();

  static Color getColor(String type) {
    type = type.toLowerCase();

    if (type == null) {
      return Color(0xffdbd9d9);
    }

    switch (type) {
      case 'fire':
        return Color(0xfffa9950);
      case 'grass':
        return Color(0xff91eb5b);
      case 'water':
        return Color(0xFF69b9e3);
      case 'rock':
        return Color(0xffedd040);
      case 'bug':
        return Color(0xffbed41c);
      case 'normal':
        return Color(0xffC6C6A7);
      case 'poison':
        return Color(0xffd651d4);
      case 'electric':
        return Color(0xffF7D02C);
      case 'ground':
        return Color(0xfff5d37d);
      case 'ice':
        return Color(0xff79dbdb);
      case 'dark':
        return Color(0xffa37e65);
      case 'fairy':
        return Color(0xfffaa7d0);
      case 'psychic':
        return Color(0xffff80a6);
      case 'fighting':
        return Color(0xffe8413a);
      case 'ghost':
        return Color(0xff9063c9);
      case 'flying':
        return Color(0xffbda8f7);
      case 'dragon':
        return Color(0xff9065f7);
      case 'steel':
        return Color(0xffa0a0de);
      default:
        return Color(0xffdbd9d9);
    }
  }
}
