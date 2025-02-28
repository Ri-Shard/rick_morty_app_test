import 'package:shared_preferences/shared_preferences.dart';

class FavoritePreference {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> setFavorite(String id) async {
    try {
      final prefs = await _prefs;
      List<String> favoriteList = prefs.getStringList('listFavorite') ?? [];
      if (!favoriteList.contains(id)) {
        favoriteList.add(id);
      }
      return prefs.setStringList('listFavorite', favoriteList);
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFavorite(String id) async {
    try {
      final prefs = await _prefs;
      List<String> favoriteList = prefs.getStringList('listFavorite') ?? [];
      favoriteList.remove(id);
      return prefs.setStringList('listFavorite', favoriteList);
    } catch (e) {
      return false;
    }
  }

  Future<List<String>> getFavorite() async{
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList('listFavorite') ?? [];
  }

}