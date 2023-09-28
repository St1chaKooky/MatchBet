part of 'bet_bloc.dart';

@immutable
sealed class BetState {}

final class BetInitial extends BetState {}

class BetLoaded extends BetState {
  final List<Bet>? betList;

  BetLoaded({required this.betList});
}

class BetLoading extends BetState {}
