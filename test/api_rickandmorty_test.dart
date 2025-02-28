import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';
import 'dart:convert';
import 'package:test_rickandmorty_map/infrastructure/datasources/api_characters_datasource.dart';
import 'package:test_rickandmorty_map/infrastructure/repositories/characters_repository_impl.dart';

import 'api_rickandmorty_test.mocks.dart';

@GenerateMocks([http.Client, CharactersRepositoryImpl])
void main() {
  group('ApiCharactersDatasource', () {
    late CharactersRepositoryImpl datasource;
    late MockClient mockClient;
    late MockCharactersRepositoryImpl mockRepository;

    setUp(() {
      mockRepository = MockCharactersRepositoryImpl();
      mockClient = MockClient();
      datasource = CharactersRepositoryImpl(ApiCharactersDatasource());
    });

    test('getAllCharacter returns a list of characters when the call completes successfully', () async {
      final response = jsonEncode([
        {
          "id": 1,
          "name": "Rick Sanchez",
          "status": "Alive",
          "species": "Human",
          "gender": "Male",
          "origin": {
            "name": "Earth",
            "url": "https://rickandmortyapi.com/api/location/1"
          },
          "location": {
            "name": "Earth",
            "url": "https://rickandmortyapi.com/api/location/20"
          },
          "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        },
        {
          "id": 2,
          "name": "Morty Smith",
          "species": "Human",
          "gender": "Male",
          "origin": {
            "name": "Earth",
            "url": "https://rickandmortyapi.com/api/location/1"
          },
          "location": {
            "name": "Earth",
            "url": "https://rickandmortyapi.com/api/location/20"
          },
          "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
        }
      ]);

      when(mockClient.get(Uri.parse('https://rickandmortyapi.com/api/character/1,2')))
          .thenAnswer((_) async => http.Response(response, 200));

      final result = await mockClient.get(Uri.parse('https://rickandmortyapi.com/api/character/1,2'));
      final characters = await datasource.getAllCharacter(2);

      expect(characters.length, 2);
      expect(result.statusCode, 200);
      expect(characters[0].name, 'Rick Sanchez');
      expect(characters[1].name, 'Morty Smith');
    });

    test('getAllCharacter returns an empty list when the call completes with an error', () async {
      
      final List<CharactersModel> list = [];
      when(mockRepository.getAllCharacter(2)).thenAnswer((_) async => list);

      when(mockClient.get(Uri.parse('https://rickandmortyapi.com/api/character/1,2')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      final result = await mockClient.get(Uri.parse('https://rickandmortyapi.com/api/character/1,2'));
      final characters = await mockRepository.getAllCharacter(2);

      expect(characters.length, 0);
      expect(result.statusCode, 404);
    });
  });
}