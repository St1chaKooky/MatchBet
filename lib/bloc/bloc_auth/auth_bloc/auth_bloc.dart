import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:match_bet/repositories/auth/user_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepo;
  late final StreamSubscription<User?> _userSubscription;
  AuthBloc({required UserRepository myUserRepo})
      : userRepo = myUserRepo,
        super(const AuthState.unknow()) {
    _userSubscription = userRepo.user.listen((authUser) {
      add(AuthChanged(authUser));
    });

    on<AuthChanged>((event, emit) {
      try {
        if (event.user != null) {
          emit(AuthState.authenticated(event.user!));
        } else {
          // ignore: prefer_const_constructors
          emit(AuthState.unauthenticated());
        }
      } catch (e) {}
    });
  }
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
