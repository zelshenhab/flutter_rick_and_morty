import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../favorites/bloc/favorites_bloc.dart';
import '../favorites/bloc/favorites_event.dart';
import '../favorites/bloc/favorites_state.dart';
import '../home/bloc/home_bloc.dart';
import '../home/bloc/home_event.dart';
import '../home/bloc/home_state.dart';
import '../home/widgets/character_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 200) {
      context.read<HomeBloc>().add(LoadCharacters());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesBloc = context.read<FavoritesBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          } else if (state is HomeLoaded || state is HomeLoadingMore) {
            final characters = (state as HomeLoaded).characters;

            return BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, favState) {
                List favorites = [];
                if (favState is FavoritesLoaded) {
                  favorites = favState.favorites;
                }

                return ListView.builder(
                  controller: _controller,
                  itemCount: characters.length + 1,
                  itemBuilder: (context, index) {
                    if (index == characters.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final c = characters[index];
                    final isFav = favorites.any((f) => f.id == c.id);

                    return CharacterCard(
                      character: c,
                      isFavorite: isFav,
                      onFavoriteToggle: () {
                        favoritesBloc.add(
                          isFav ? RemoveFavorite(c) : AddFavorite(c),
                        );
                      },
                    );
                  },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
