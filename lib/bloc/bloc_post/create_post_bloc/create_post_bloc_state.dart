part of 'create_post_bloc_bloc.dart';

sealed class CreatePostBlocState extends Equatable {
  const CreatePostBlocState();

  @override
  List<Object> get props => [];
}

final class CreatePostBlocInitial extends CreatePostBlocState {}

final class CreatePostFailure extends CreatePostBlocState {}

final class CreatePostLoading extends CreatePostBlocState {}

final class CreatePostSuccess extends CreatePostBlocState {
  final Post post;

  CreatePostSuccess(this.post);
}
