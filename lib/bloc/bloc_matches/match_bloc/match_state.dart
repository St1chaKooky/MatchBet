part of 'match_bloc.dart';

@immutable
sealed class MatchState {}

final class MatchInitial extends MatchState {}

class MatchLoading extends MatchState {}

class MatchLoaded extends MatchState {
  final MatchModel matchModel;

  MatchLoaded({required this.matchModel});
}

class MatchLoadingError extends MatchState {}
