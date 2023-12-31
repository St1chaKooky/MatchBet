import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:match_bet/repositories/post_repositories/models/post_model.dart';
import 'package:match_bet/repositories/post_repositories/post_repo.dart';

part 'get_post_bloc_event.dart';
part 'get_post_bloc_state.dart';

class GetPostBlocBloc extends Bloc<GetPostBlocEvent, GetPostBlocState> {
  PostRepository _postRepository;
  GetPostBlocBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(GetPostBlocInitial()) {
    on<GetPosts>((event, emit) async {
      emit(GetPostLoading());
      try {
        List<Post> posts = await _postRepository.getePost();
        emit(GetPostSuccess(posts));
      } catch (e) {
        emit(GetPostFailure());
      }
    });
  }
}
