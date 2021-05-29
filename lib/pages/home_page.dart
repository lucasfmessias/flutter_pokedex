import 'package:flutter/material.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/repositories/poke_repository_impl.dart';
import 'package:pokedex/widgets/infinite_grid_view.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(PokeRepositoryImpl());

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
      body: Container(
        color: Colors.red.shade900.withOpacity(0.85),
        child: InfiniteGridView(
          crossAxisCount: 2,
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
      title: Image.asset(
        "lib/assets/logo/Pokedex_logo.png",
        fit: BoxFit.contain,
        height: 62,
      ),
      toolbarHeight: 88,
      centerTitle: true,
      // elevation: 0,
      backgroundColor: Colors.red.shade900.withOpacity(0.90),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () {},
        )
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
