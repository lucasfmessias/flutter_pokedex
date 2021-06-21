import 'package:flutter/material.dart';

import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/repositories/poke_repository_impl.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({
    Key key,
  }) : super(key: key);

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  final TextEditingController _filter = new TextEditingController();
  IconData _searchIcon = Icons.search;
  bool _folded = true;

  final _controller = HomeController(PokeRepositoryImpl());

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _folded ? 56 : MediaQuery.of(context).size.width * 0.92,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: kElevationToShadow[6],
      ),
      child: Row(
        children: [
          _inputTextField(),
          _drawSearchBarAnimated(),
        ],
      ),
    );
  }

  Widget _inputTextField() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 16),
        child: !_folded
            ? TextField(
                controller: _filter,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search Pokemon',
                  hintStyle: TextStyle(color: Colors.blue[300]),
                  border: InputBorder.none,
                ),
              )
            : null,
      ),
    );
  }

  Widget _drawSearchBarAnimated() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      // Fixing the splash
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          // Fixing the BorderRadius of the splah
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_folded ? 32 : 0),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(_folded ? 32 : 0),
            bottomRight: Radius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              _folded ? _searchIcon = Icons.search : _searchIcon = Icons.close,
              color: Colors.blue[900],
            ),
          ),
          onTap: () {
            setState(() {
              _folded = !_folded;
              // _searchPressed();
            });
          },
        ),
      ),
    );
  }

  void _searchPressed() {
    if (_searchIcon == Icons.search) {
      _searchIcon = Icons.close;
      _filter.addListener(() {
        if (_filter.text.isNotEmpty) {
          _controller.fetchByName(pokemonName: _filter.text.toLowerCase());
          setState(() {});
        }
      });
    } else {
      _searchIcon = Icons.search;
      _filter.clear();
    }
  }
}
