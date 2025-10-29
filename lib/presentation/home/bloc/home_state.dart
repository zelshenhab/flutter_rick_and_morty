import 'package:equatable/equatable.dart';
import '../../../data/models/character_model.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Character> characters;
  HomeLoaded({required this.characters});

  @override
  List<Object?> get props => [characters];
}

class HomeLoadingMore extends HomeLoaded {
  HomeLoadingMore({required super.characters});
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
