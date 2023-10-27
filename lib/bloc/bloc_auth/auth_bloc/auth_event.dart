part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthChanged extends AuthEvent {
  final User? user;

  const AuthChanged(this.user);
}

class AuthLogoutRequested extends AuthEvent {}
