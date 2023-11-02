import 'package:equatable/equatable.dart';
import 'package:match_bet/repositories/auth/entity/user_entity.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;

  final String? picture;

  const MyUser(
      {required this.id,
      required this.email,
      required this.name,
      this.picture});

  static const empty = MyUser(
    id: '',
    email: '',
    name: '',
    picture: '',
  );
  MyUser copyWith({
    final String? id,
    final String? email,
    final String? name,
    final String? picture,
  }) {
    return MyUser(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        picture: picture ?? this.picture);
  }

  bool get isEmpty => this == MyUser.empty;
  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      picture: picture,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      picture: entity.picture,
    );
  }

  @override
  List<Object?> get props => [id, email, name, picture];

  @override
  String toString() {
    return '''UserEntity: {
      id: $id
      email: $email
      name: $name
      picture: $picture
    }''';
  }
}
