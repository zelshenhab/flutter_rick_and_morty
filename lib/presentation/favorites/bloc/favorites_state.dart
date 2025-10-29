import 'package:equatable/equatable.dart';
import '../../../data/models/character_model.dart';

abstract class FavoritesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<Character> favorites;

  FavoritesLoaded(this.favorites);

  @override
  List<Object?> get props => [favorites];
}
