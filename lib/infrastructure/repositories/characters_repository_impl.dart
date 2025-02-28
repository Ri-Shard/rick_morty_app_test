import 'package:test_rickandmorty_map/domain/datasources/characters_datasource.dart';
import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';
import 'package:test_rickandmorty_map/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  final CharactersDatasource datasource;

  CharactersRepositoryImpl(this.datasource);

  @override
  Future<List<CharactersModel>> getAllCharacter(int count) {
    return datasource.getAllCharacter(count);
  }

  @override
  Future<List<CharactersModel>> getNameCharacter(String name) {
    return datasource.getNameCharacter(name);
  }

  @override
  Future<List<CharactersModel>> getFavoriteCharacter() {
    return datasource.getFavoriteCharacter();
  }
}
