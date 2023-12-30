import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:match_bet/repositories/auth_repositories/models/my_user_model.dart';
import 'package:match_bet/repositories/auth_repositories/user_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;
  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());
      try {
        MyUser user = await _userRepository.signUp(event.user, event.password);
        if (user.email == ' ' && user.id == ' ') {
          emit(SignUpError(error: user.name));
        } else {
          await _userRepository.setUserData(user);
          emit(SignUpSuccess());
        }
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
