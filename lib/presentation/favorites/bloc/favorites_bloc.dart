import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/characters_repository.dart';
import '../../../data/models/character_model.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final CharactersRepository repository;
  List<Character> favorites = [];

  FavoritesBloc(this.repository) : super(FavoritesLoading()) {
    on<LoadFavorites>((event, emit) {
      favorites = repository.getFavorites();
      emit(FavoritesLoaded(favorites));
    });

    on<AddFavorite>((event, emit) async {
      favorites.add(event.character);
      await repository.saveFavorites(favorites);
      emit(FavoritesLoaded(List.from(favorites)));
    });

    on<RemoveFavorite>((event, emit) async {
      favorites.removeWhere((f) => f.id == event.character.id);
      await repository.saveFavorites(favorites);
      emit(FavoritesLoaded(List.from(favorites)));
    });

    on<SortFavorites>((event, emit) {
      if (event.criteria == 'name') {
        favorites.sort((a, b) => a.name.compareTo(b.name));
      } else if (event.criteria == 'status') {
        favorites.sort((a, b) => a.status.compareTo(b.status));
      }
      emit(FavoritesLoaded(List.from(favorites)));
    });

    add(LoadFavorites());
  }
}
