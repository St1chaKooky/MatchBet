part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

class AuthState extends Equatable {
  final AuthStatus status;
  final User? user;

  const AuthState._({this.status = AuthStatus.unknown, this.user});

  //No info
  const AuthState.unknow() : this._();

  //Login user
  const AuthState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  //Curent user is unauth
  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
