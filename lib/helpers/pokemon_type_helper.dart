import 'package:flutter/material.dart';

class PokemonTypeHelper {
  const PokemonTypeHelper._();

  static Color getColor(String type) {
    type = type.toLowerCase();
    if (type == null) {
      return Color(0xffdbd9d9);
    }
    switch (type) {
      case 'fire':
        return Color(0xffF08030);
      case 'grass':
        return Color(0xff7AC74C);
      case 'water':
        return Color(0xFF6390F0);
      case 'rock':
        return Color(0xffB6A136);
      case 'bug':
        return Color(0xffA8B820);
      case 'normal':
        return Color(0xffA8A878);
      case 'poison':
        return Color(0xffA33EA1);
      case 'electric':
        return Color(0xfffce321);
      case 'ground':
        return Color(0xffE2BF65);
      case 'ice':
        return Color(0xff98D8D8);
      case 'dark':
        return Color(0xff705746);
      case 'fairy':
        return Color(0xffD685AD);
      case 'psychic':
        return Color(0xffF95587);
      case 'fighting':
        return Color(0xffC22E28);
      case 'ghost':
        return Color(0xff735797);
      case 'flying':
        return Color(0xffA98FF3);
      case 'dragon':
        return Color(0xff6F35FC);
      case 'steel':
        return Color(0xffB7B7CE);
      default:
        return Color(0xffdbd9d9);
    }
  }

  static String getIcon(String type) {
    switch (type) {
      case 'fire':
        return 'G';
      case 'grass':
        return 'J';
      case 'water':
        return 'R';
      case 'rock':
        return 'P';
      case 'bug':
        return 'A';
      case 'normal':
        return 'M';
      case 'poison':
        return 'N';
      case 'electric':
        return 'D';
      case 'ground':
        return 'K';
      case 'ice':
        return 'L';
      case 'dark':
        return 'B';
      case 'fairy':
        return 'E';
      case 'psychic':
        return 'O';
      case 'fighting':
        return 'F';
      case 'ghost':
        return 'I';
      case 'flying':
        return 'H';
      case 'dragon':
        return 'C';
      case 'steel':
        return 'Q';
      default:
        return 'A';
    }
  }
}
