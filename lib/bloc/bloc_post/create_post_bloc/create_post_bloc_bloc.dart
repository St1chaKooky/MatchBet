import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:match_bet/repositories/post_repositories/models/post_model.dart';

part 'create_post_bloc_event.dart';
part 'create_post_bloc_state.dart';

class CreatePostBlocBloc
    extends Bloc<CreatePostBlocEvent, CreatePostBlocState> {
  CreatePostBlocBloc() : super(CreatePostBlocInitial()) {
    on<CreatePost>((event, emit) {
      emit(CreatePostLoading());
      try {} catch (e) {
        emit(CreatePostFailure());
      }
    });
  }
}
