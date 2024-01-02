import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:match_bet/repositories/post_repositories/models/post_model.dart';
import 'package:match_bet/repositories/post_repositories/post_repo.dart';

part 'create_post_bloc_event.dart';
part 'create_post_bloc_state.dart';

class CreatePostBlocBloc
    extends Bloc<CreatePostBlocEvent, CreatePostBlocState> {
  PostRepository _postRepository;
  CreatePostBlocBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(CreatePostBlocInitial()) {
    on<CreatePost>((event, emit) async {
      emit(CreatePostLoading());
      try {
        Post post = await _postRepository.createPost(event.post);
        emit(CreatePostSuccess(post));
      } catch (e) {
        emit(CreatePostFailure());
      }
    });
  }
}
