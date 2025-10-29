import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/character_model.dart';

class LocalStorageService {
  static const String favoritesBox = 'favorites_box';
  static const String cacheBox = 'cache_box';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(favoritesBox);
    await Hive.openBox(cacheBox);
  }

  Future<void> saveFavorites(List<Character> favorites) async {
    final box = Hive.box(favoritesBox);
    await box.put('favorites', favorites.map((e) => e.toJson()).toList());
  }

  List<Character> getFavorites() {
    final box = Hive.box(favoritesBox);
    final data = box.get('favorites', defaultValue: []);
    return List<Map<String, dynamic>>.from(data)
        .map((e) => Character.fromJson(e))
        .toList();
  }

  Future<void> saveCache(List<Character> characters) async {
    final box = Hive.box(cacheBox);
    await box.put('cache', characters.map((e) => e.toJson()).toList());
  }

  List<Character> getCache() {
    final box = Hive.box(cacheBox);
    final data = box.get('cache', defaultValue: []);
    return List<Map<String, dynamic>>.from(data)
        .map((e) => Character.fromJson(e))
        .toList();
  }
}
