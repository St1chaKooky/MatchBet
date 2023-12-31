part of 'create_post_bloc_bloc.dart';

sealed class CreatePostBlocEvent extends Equatable {
  const CreatePostBlocEvent();

  @override
  List<Object> get props => [];
}

class CreatePost extends CreatePostBlocEvent {
  final Post post;
  const CreatePost(this.post);
}
