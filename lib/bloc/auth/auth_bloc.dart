import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:match_bet/repositories/auth/domain/auth_repositories.dart';
import 'package:match_bet/repositories/auth/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositories _authRepo;
  StreamSubscription<User>? _userSubscription;
  AuthBloc({required AuthRepositories authRepo})
      : _authRepo = authRepo,
        super(authRepo.currentUser.isNotEmpty
            ? AuthState.authenticated(authRepo.currentUser)
            : const AuthState.unauthenticated()) {
    on<UserLogout>(_onUserLogout);
    on<UserChanged>(_onUserChanged);
  }
  void _onUserLogout(
    UserLogout event,
    Emitter<AuthState> emit,
  ) {
    unawaited(_authRepo.logOut());
  }

  void _onUserChanged(
    UserChanged event,
    Emitter<AuthState> emit,
  ) {
    event.user.isNotEmpty
        ? AuthState.authenticated(event.user)
        : const AuthState.unauthenticated();
  }
}
