import 'package:hive_flutter/hive_flutter.dart';
import '../models/character_model.dart';

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
    final raw = box.get('favorites', defaultValue: []);

    final List<Character> favorites = (raw as List)
        .map((item) => Map<String, dynamic>.from(item))
        .map((json) => Character.fromJson(json))
        .toList();

    return favorites;
  }

  Future<void> saveCache(List<Character> characters) async {
    final box = Hive.box(cacheBox);
    await box.put('cache', characters.map((e) => e.toJson()).toList());
  }

  List<Character> getCache() {
    final box = Hive.box(cacheBox);
    final raw = box.get('cache', defaultValue: []);

    final List<Character> cached = (raw as List)
        .map((item) => Map<String, dynamic>.from(item))
        .map((json) => Character.fromJson(json))
        .toList();

    return cached;
  }
}
