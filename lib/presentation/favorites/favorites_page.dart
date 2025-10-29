import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/favorites_bloc.dart';
import 'bloc/favorites_event.dart';
import 'bloc/favorites_state.dart';
import 'widgets/favorite_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (v) => context.read<FavoritesBloc>().add(SortFavorites(v)),
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'name', child: Text('Sort by Name')),
              PopupMenuItem(value: 'status', child: Text('Sort by Status')),
            ],
          )
        ],
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoritesLoaded) {
            if (state.favorites.isEmpty) {
              return const Center(child: Text('No favorites yet'));
            }
            final favorites = state.favorites;
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final c = favorites[index];
                return FavoriteCard(
                  character: c,
                  onRemove: () {
                    context.read<FavoritesBloc>().add(RemoveFavorite(c));
                  },
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
