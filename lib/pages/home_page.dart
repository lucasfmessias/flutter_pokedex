import 'package:flutter/material.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/repositories/poke_repository_impl.dart';
import 'package:pokedex/widgets/infinite_grid_view.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/widgets/search_bar_animated.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(PokeRepositoryImpl());
  final Color pokedexColor = const Color.fromARGB(255, 220, 9, 45);

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    await _controller.fetch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: AnimatedSearchBar(),
      body: Container(
        color: pokedexColor,
        child: InfiniteGridView(
          itemBuilder: _buildPokemonCard,
          itemCount: _controller.lengh, // Current itemCount you have
          hasNext: _controller.lengh <
              1118, // let the widget know if you have more data to show or not
          nextData:
              onNextData, // callback called when end to the list is reach and hasNext is true
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 88,
      centerTitle: true,
      elevation: 0,
      backgroundColor: pokedexColor,
      title: Image.asset(
        "lib/assets/logo/Pokedex_logo.png",
        height: 88 * 0.8,
        alignment: Alignment.topCenter,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          padding: EdgeInsets.only(right: 20),
          icon: Icon(Icons.info_outline),
          iconSize: 28,
          onPressed: () {},
        ),
      ],
    );
  }

  void onNextData() async {
    await _controller.next();
    setState(() {});
  }

  Widget _buildPokemonCard(BuildContext context, int index) {
    final pokemon = _controller.pokemons[index];

    return PokemonCard(
      pokemon: pokemon,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailPage(pokemon: pokemon),
          ),
        );
      },
    );
  }
}
