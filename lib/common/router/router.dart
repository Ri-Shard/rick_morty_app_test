import 'package:go_router/go_router.dart';
import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';
import 'package:test_rickandmorty_map/presentation/screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: CharactersScreen.name,
      builder: (context, state) => const CharactersScreen()),
  GoRoute(
    path: '/detail/:isFavorite',
    name: CharacterDetailScreen.name,
    builder: (context, state) {
      final CharactersModel character = state.extra as CharactersModel;
      final isFavorite = state.pathParameters['isFavorite'] == 'true';
      return CharacterDetailScreen(
          character: character, isFavorite: isFavorite);
    },
  ),
  GoRoute(
      path: '/favorite',
      name: FavoriteCharactersScreen.name,
      builder: (context, state) => const FavoriteCharactersScreen())
]);
