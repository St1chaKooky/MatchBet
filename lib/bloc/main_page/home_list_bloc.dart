import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_list_event.dart';
part 'home_list_state.dart';

class HomeListBloc extends Bloc<HomeListEvent, HomeListState> {
  HomeListBloc() : super(HomeListInitial()) {
    on<HomeListEvent>((event, emit) {});
  }
}
