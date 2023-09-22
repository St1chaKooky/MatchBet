import 'package:bloc/bloc.dart';
import 'package:match_bet/models/response_models/match_model.dart';
import 'package:meta/meta.dart';
import 'package:match_bet/repositories/methods/api_methods/api_methods.dart';
part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc(this.apiMethods, this.id) : super(MatchInitial()) {
    on<LoadMatch>((event, emit) async {
      final matchModel = await apiMethods.getMatchDetails(id);
      emit(MatchLoaded(matchModel: matchModel));
    });
  }
  final ApiMethods apiMethods;
  int id;
}
