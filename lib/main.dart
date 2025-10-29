import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty/main/main_page.dart';
import 'package:flutter_rick_and_morty/presentation/home/bloc/home_event.dart';
import 'core/theme/app_theme.dart';
import 'data/services/api_service.dart';
import 'data/services/local_storage_service.dart';
import 'data/repositories/characters_repository.dart';
import 'presentation/home/bloc/home_bloc.dart';
import 'presentation/favorites/bloc/favorites_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localStorage = LocalStorageService();
  await localStorage.init();

  final repository = CharactersRepository(ApiService(), localStorage);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final CharactersRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(repository)..add(LoadCharacters()),
        ),
        BlocProvider(
          create: (_) => FavoritesBloc(repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick & Morty',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const MainPage(),
      ),
    );
  }
}
