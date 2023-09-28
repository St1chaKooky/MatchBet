import 'package:bloc/bloc.dart';
import 'package:match_bet/models/bets/bet.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';
import 'package:meta/meta.dart';

part 'bet_event.dart';
part 'bet_state.dart';

class BetBloc extends Bloc<BetEvent, BetState> {
  BetBloc(this.apiMethods, this.id) : super(BetInitial()) {
    on<LoadBet>((event, emit) async {
      final betList = await apiMethods.getBets(id);
      emit(BetLoaded(betList: betList));
    });
  }
  final ApiMethods apiMethods;
  int id;
}
