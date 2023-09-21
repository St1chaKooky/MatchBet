import 'package:bloc/bloc.dart';
import 'package:match_bet/models/matches/match_model.dart';
import 'package:meta/meta.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';

part 'live_event.dart';
part 'live_state.dart';

class LiveBloc extends Bloc<LiveEvent, LiveState> {
  LiveBloc(this.apiMethods) : super(LiveInitial()) {
    on<LoadLive>((event, emit) async {
      final leagueList = await apiMethods
          .getLegueMap(); // тут получаем отсортированый масив лиг, в каждом подмасиве матчи относящиеся к одной лиге
      emit(LiveLoaded(leagueList: leagueList));
    });
  }
  final ApiMethods apiMethods;
}
