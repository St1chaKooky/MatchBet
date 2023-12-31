part of 'get_post_bloc_bloc.dart';

sealed class GetPostBlocState extends Equatable {
  const GetPostBlocState();

  @override
  List<Object> get props => [];
}

final class GetPostBlocInitial extends GetPostBlocState {}

final class GetPostFailure extends GetPostBlocState {}

final class GetPostLoading extends GetPostBlocState {}

final class GetPostSuccess extends GetPostBlocState {
  final List<Post> posts;

  GetPostSuccess(this.posts);
}
