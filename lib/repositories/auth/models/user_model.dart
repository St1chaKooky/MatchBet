import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    this.email,
    this.bio,
    this.photoUrl,
    required this.id,
  });

  final String? email;

  final String? bio;
  final String? photoUrl;
  final String id;

  static const empty = User(id: '');
  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, email, bio, photoUrl];
}
