import 'package:flutter/material.dart';
import 'package:pokedex/controllers/detail_controller.dart';
import 'package:pokedex/helpers/pokemon_helper.dart';
import 'package:pokedex/helpers/pokemon_type_helper.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/widgets/metric_tile.dart';
import 'package:pokedex/widgets/pokemon_header.dart';
import 'package:pokedex/widgets/horizontal_bar.dart';
import 'package:pokedex/widgets/pokemon_type_chip.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel pokemon;

  const DetailPage({
    Key key,
    this.pokemon,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _controller = DetailController();

  @override
  void initState() {
    _controller.setPokemon(widget.pokemon);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        _controller.name.replaceFirst(
            _controller.name[0], _controller.name[0].toUpperCase()),
        style: TextStyle(fontFamily: 'PokemonSolid'),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: _controller.primaryColor,
      actions: [
        Container(
          height: 52,
          width: 80,
          child: Center(
            child: Text(
              _controller.id,
              style: TextStyle(fontSize: 18, fontFamily: 'PokemonSolid'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PokemonHeader(
          imageUrl: _controller.imgUrl,
          backgroundColor: _controller.primaryColor,
        ),
        _buildTypes(),
        _buildMetrics(),
        _buildStats(),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Base Stats',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          PokemonStatBar(
            label: 'HP',
            value: _controller.health,
            foregroundColor: widget.pokemon.type1 == 'electric'
                ? PokemonHelper.getColor(widget.pokemon.type1)
                : PokemonTypeHelper.getColor(widget.pokemon.type1),
          ),
          PokemonStatBar(
            label: 'ATK',
            value: _controller.attack,
            foregroundColor: widget.pokemon.type1 == 'electric'
                ? PokemonHelper.getColor(widget.pokemon.type1)
                : PokemonTypeHelper.getColor(widget.pokemon.type1),
          ),
          PokemonStatBar(
            label: 'DEF',
            value: _controller.defense,
            foregroundColor: widget.pokemon.type1 == 'electric'
                ? PokemonHelper.getColor(widget.pokemon.type1)
                : PokemonTypeHelper.getColor(widget.pokemon.type1),
          ),
          PokemonStatBar(
            label: 'SPD',
            value: _controller.speed,
            foregroundColor: widget.pokemon.type1 == 'electric'
                ? PokemonHelper.getColor(widget.pokemon.type1)
                : PokemonTypeHelper.getColor(widget.pokemon.type1),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _infoEvolutionCard(label: 'ID', content: _controller.id),
                _infoEvolutionCard(label: 'Name', content: _controller.name),
                _infoEvolutionCard(
                    label: 'Type', content: _controller.types[0]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _controller.types
          .map((type) => PokemonTypeChip(
                type: type,
              ))
          .toList(),
    );
  }

  Widget _buildMetrics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MetricTile(
          value: _controller.height,
          label: 'Height',
          unit: 'm',
        ),
        MetricTile(
          value: _controller.weight,
          label: 'Weight',
          unit: 'kg',
        ),
      ],
    );
  }

  Widget _infoEvolutionCard({String label, String content}) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 100.0,
      decoration: BoxDecoration(
        color: Color(0xFFF8F2F7),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
