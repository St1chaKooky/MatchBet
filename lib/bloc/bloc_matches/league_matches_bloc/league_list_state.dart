part of 'league_list_bloc.dart';

@immutable
sealed class LeagueListState {}

class LeagueListInitial extends LeagueListState {}

class LeagueListLoading extends LeagueListState {}

class LeagueListLoaded extends LeagueListState {
  final List<List<MatchModel>> leagueList;

  LeagueListLoaded({required this.leagueList});
}

class LeagueListLoadingError extends LeagueListState {}
