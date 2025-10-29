import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/characters_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CharactersRepository repository;
  int currentPage = 1;
  bool hasReachedEnd = false;

  HomeBloc(this.repository) : super(HomeLoading()) {
    on<LoadCharacters>((event, emit) async {
      if (hasReachedEnd) return;
      if (state is HomeLoaded) {
        emit(HomeLoadingMore(characters: (state as HomeLoaded).characters));
      }

      try {
        final characters = await repository.getCharacters(currentPage);
        if (characters.isEmpty) {
          hasReachedEnd = true;
        } else {
          currentPage++;
          final all = [
            if (state is HomeLoaded) ...((state as HomeLoaded).characters),
            ...characters,
          ];
          emit(HomeLoaded(characters: all));
        }
      } catch (_) {
        emit(HomeError('Failed to load characters'));
      }
    });
  }
}
