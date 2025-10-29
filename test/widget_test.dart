import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_rick_and_morty/main.dart';
import 'package:flutter_rick_and_morty/data/repositories/characters_repository.dart';
import 'package:flutter_rick_and_morty/data/services/api_service.dart';
import 'package:flutter_rick_and_morty/data/services/local_storage_service.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    final repository = CharactersRepository(
      ApiService(),
      LocalStorageService(),
    );

    await tester.pumpWidget(MyApp(repository: repository));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
