import 'dart:convert';

import 'package:test_rickandmorty_map/common/utils/favorite_preference.dart';
import 'package:test_rickandmorty_map/domain/datasources/characters_datasource.dart';
import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';
import 'package:http/http.dart' as http;

class ApiCharactersDatasource extends CharactersDatasource {
  final favoritePreference = FavoritePreference();

  @override
  Future<List<CharactersModel>> getAllCharacter(int count) async {
    List<CharactersModel> characters = [];
    List<int> ids = List<int>.generate(count, (i) => i + 1);
    String idsString = ids.join(',');

    try {
      final rest = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/$idsString'),
      );
      if (rest.statusCode == 200) {
        List<dynamic> jsonData = json.decode(rest.body);
        characters =
            jsonData.map((item) => CharactersModel.fromJson(item)).toList();
      }
      return characters;
    } catch (e) {
      return characters;
    }
  }

  @override
  Future<List<CharactersModel>> getNameCharacter(String name) async {
    List<CharactersModel> characters = [];
    try {
      final rest = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?name=$name'),
      );
      if (rest.statusCode == 200) {
        List<dynamic> jsonData = json.decode(rest.body)['results'];
        characters =
            jsonData.map((item) => CharactersModel.fromJson(item)).toList();
      }
      return characters;
    } catch (e) {
      return characters;
    }
  }

  @override
  Future<List<CharactersModel>> getFavoriteCharacter() async {
    List<CharactersModel> characters = [];
    final data = await favoritePreference.getFavorite();
    String idsString = data.join(',');
    print(idsString);
    try {
      final rest = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/$idsString'),
      );
      if (rest.statusCode == 200) {
        List<dynamic> jsonData = json.decode(rest.body);
        characters =
            jsonData.map((item) => CharactersModel.fromJson(item)).toList();
      }
      return characters;
    } catch (e) {
      return characters;
    }
  }
}
