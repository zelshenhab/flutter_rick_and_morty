import 'package:equatable/equatable.dart';
import '../../../data/models/character_model.dart';

abstract class FavoritesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFavorites extends FavoritesEvent {}

class AddFavorite extends FavoritesEvent {
  final Character character;
  AddFavorite(this.character);

  @override
  List<Object?> get props => [character];
}

class RemoveFavorite extends FavoritesEvent {
  final Character character;
  RemoveFavorite(this.character);

  @override
  List<Object?> get props => [character];
}

class SortFavorites extends FavoritesEvent {
  final String criteria;
  SortFavorites(this.criteria);

  @override
  List<Object?> get props => [criteria];
}
