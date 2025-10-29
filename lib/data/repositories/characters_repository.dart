import '../models/character_model.dart';
import '../services/api_service.dart';
import '../services/local_storage_service.dart';

class CharactersRepository {
  final ApiService api;
  final LocalStorageService local;

  CharactersRepository(this.api, this.local);

  Future<List<Character>> getCharacters(int page) async {
    try {
      final data = await api.fetchCharacters(page);
      if (page == 1) await local.saveCache(data);
      return data;
    } catch (_) {
      return local.getCache();
    }
  }

  List<Character> getFavorites() => local.getFavorites();

  Future<void> saveFavorites(List<Character> favorites) =>
      local.saveFavorites(favorites);
}
