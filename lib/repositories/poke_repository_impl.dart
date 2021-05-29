import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/core/errors.dart';

import '../core/app_conts.dart';

import '../models/pokemon_model.dart';
import 'poke_repository.dart';

class PokeRepositoryImpl implements PokeRepository {
  @override
  Future<Either<Failure, List<PokemonModel>>> fetch(
      {int offset = 0, int limit = 20}) async {
    try {
      // DIO acessar rest API
      final dio = Dio();

      // print('$kBaseUrl/pokemon?offset=$offset&limit=$limit');
      final response = await dio.get(
        '$kBaseUrl/pokemon?offset=$offset&limit=$limit',
      );

      final list = response.data['results'] as List;
      final urls = list.map((data) => data['url']);

      final pokemons = <PokemonModel>[];
      for (var url in urls) {
        final pokemon = await fetchByUrl(url);
        pokemons.add(pokemon);
      }

      return Right(pokemons);
    } on DioError catch (error) {
      return Left(ApiError(error.message));
    } catch (error) {
      return Left(UnknownError(error.message));
    }
  }

  @override
  Future<PokemonModel> fetchByUrl(String url) async {
    final dio = Dio();
    final response = await dio.get(url);
    return PokemonModel.fromMap(response.data);
  }
}
