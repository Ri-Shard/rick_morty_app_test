// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on CharactersBase, Store {
  late final _$charactersAtom =
      Atom(name: 'CharactersBase.characters', context: context);

  @override
  ObservableList<CharactersModel> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<CharactersModel> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: 'CharactersBase.favorites', context: context);

  @override
  ObservableList<CharactersModel> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<CharactersModel> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$filterCharactersAtom =
      Atom(name: 'CharactersBase.filterCharacters', context: context);

  @override
  ObservableList<CharactersModel> get filterCharacters {
    _$filterCharactersAtom.reportRead();
    return super.filterCharacters;
  }

  @override
  set filterCharacters(ObservableList<CharactersModel> value) {
    _$filterCharactersAtom.reportWrite(value, super.filterCharacters, () {
      super.filterCharacters = value;
    });
  }

  late final _$fetchCharactersAsyncAction =
      AsyncAction('CharactersBase.fetchCharacters', context: context);

  @override
  Future<void> fetchCharacters(int count) {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters(count));
  }

  late final _$applyFilterAsyncAction =
      AsyncAction('CharactersBase.applyFilter', context: context);

  @override
  Future<void> applyFilter(String text) {
    return _$applyFilterAsyncAction.run(() => super.applyFilter(text));
  }

  late final _$getFavoritesAsyncAction =
      AsyncAction('CharactersBase.getFavorites', context: context);

  @override
  Future<void> getFavorites() {
    return _$getFavoritesAsyncAction.run(() => super.getFavorites());
  }

  late final _$addFavoriteAsyncAction =
      AsyncAction('CharactersBase.addFavorite', context: context);

  @override
  Future<bool> addFavorite(String id) {
    return _$addFavoriteAsyncAction.run(() => super.addFavorite(id));
  }

  late final _$deleteFavoriteAsyncAction =
      AsyncAction('CharactersBase.deleteFavorite', context: context);

  @override
  Future<bool> deleteFavorite(String id) {
    return _$deleteFavoriteAsyncAction.run(() => super.deleteFavorite(id));
  }

  @override
  String toString() {
    return '''
characters: ${characters},
favorites: ${favorites},
filterCharacters: ${filterCharacters}
    ''';
  }
}
