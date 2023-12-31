part of 'get_post_bloc_bloc.dart';

sealed class GetPostBlocEvent extends Equatable {
  const GetPostBlocEvent();

  @override
  List<Object> get props => [];
}

class GetPosts extends GetPostBlocEvent {}
