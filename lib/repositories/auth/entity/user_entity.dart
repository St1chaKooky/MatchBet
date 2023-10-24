import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String srName;
  final String? picture;

  const MyUserEntity(
      {required this.id,
      required this.email,
      required this.name,
      required this.srName,
      this.picture});
  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'srName': srName,
      'picture': picture,
    };
  }

  static MyUserEntity formDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc['id'] as String,
      email: doc['email'] as String,
      name: doc['name'] as String,
      srName: doc['srName'] as String,
      picture: doc['picture'] as String,
    );
  }

  @override
  List<Object?> get props => [id, email, name, srName, picture];
}
