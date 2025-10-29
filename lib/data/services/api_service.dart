import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/character_model.dart';

class ApiService {
  static const baseUrl = 'https://rickandmortyapi.com/api/character';

  Future<List<Character>> fetchCharacters(int page) async {
    final response = await http.get(Uri.parse('$baseUrl?page=$page'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List results = jsonData['results'];
      return results.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
