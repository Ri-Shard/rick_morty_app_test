import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';

abstract class CharactersRepository {
  Future<List<CharactersModel>> getAllCharacter(int count);

  Future<List<CharactersModel>> getNameCharacter(String name);

  Future<List<CharactersModel>> getFavoriteCharacter();
}
