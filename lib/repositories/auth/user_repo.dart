import 'package:match_bet/repositories/auth/models/user_model.dart';

abstract class UserRepository {
  Future<void> signIn(String email, String password);
  Future<void> logOut();
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> resetPassword(String email);
}
