part of 'live_bloc.dart';

@immutable
sealed class LiveState {}

class LiveInitial extends LiveState {}

class LiveLoading extends LiveState {}

class LiveLoaded extends LiveState {
  final List<List<MatchModel>> leagueList;

  LiveLoaded({required this.leagueList});
}

class LiveLodingError extends LiveState {}
