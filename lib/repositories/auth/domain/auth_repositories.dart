import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:match_bet/repositories/auth/models/user_model.dart';

abstract class AuthRepositories {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  AuthRepositories({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  var currentUser = User.empty;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (err) {
      print('Error create user $err');
    }
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (err) {
      print('Error login user $err');
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([_firebaseAuth.signOut()]);
    } catch (err) {
      print('Error Logout $err');
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, bio: displayName, photoUrl: photoURL);
  }
}
