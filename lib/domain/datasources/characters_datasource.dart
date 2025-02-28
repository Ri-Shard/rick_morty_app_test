import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';

abstract class CharactersDatasource {
  Future<List<CharactersModel>> getAllCharacter(int count);

  Future<List<CharactersModel>> getFavoriteCharacter();

  Future<List<CharactersModel>> getNameCharacter(String name);
}
