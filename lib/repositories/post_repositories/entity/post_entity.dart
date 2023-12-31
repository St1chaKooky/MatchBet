import 'package:equatable/equatable.dart';
import 'package:match_bet/repositories/auth_repositories/entity/user_entity.dart';
import 'package:match_bet/repositories/auth_repositories/models/my_user_model.dart';

class PostEntity extends Equatable {
  final String postId;
  final String post;
  final DateTime createAt;
  final MyUser myUser;
  final String team1;
  final String team2;
  final String nameBet;
  final String time;
  final String date;
  final String k;
  final int like;
  final int disLike;

  const PostEntity({
    required this.postId,
    required this.post,
    required this.createAt,
    required this.myUser,
    required this.team1,
    required this.team2,
    required this.nameBet,
    required this.time,
    required this.date,
    required this.k,
    required this.like,
    required this.disLike,
  });

  Map<String, Object?> toDocument() {
    return {
      'postId': postId,
      'post': post,
      'createAt': createAt,
      'myUser': myUser.toEntity().toDocument(),
      'team1': team1,
      'team2': team2,
      'nameBet': nameBet,
      'time': time,
      'date': date,
      'k': k,
      'like': like,
      'disLike': disLike,
    };
  }

  static PostEntity formDocument(Map<String, dynamic> doc) {
    return PostEntity(
      postId: doc['postId'] as String,
      post: doc['post'] as String,
      createAt: DateTime.parse(doc['createAt']),
      myUser: MyUser.fromEntity(MyUserEntity.formDocument(doc['myUser'])),
      team1: doc['team1'] as String,
      team2: doc['team2'] as String,
      nameBet: doc['nameBet'] as String,
      time: doc['time'] as String,
      date: doc['date'] as String,
      k: doc['k'] as String,
      like: doc['like'] as int,
      disLike: doc['disLike'] as int,
    );
  }

  @override
  List<Object?> get props => [
        postId,
        post,
        createAt,
        myUser,
        team1,
        team2,
        nameBet,
        time,
        date,
        k,
        like,
        disLike,
      ];
  @override
  String toString() {
    return '''PostEntity: {
      postId: $postId
      post: $post
      createAt: $createAt
      myUser: $myUser
      team1: $team1
      team2: $team2
      nameBet: $nameBet
      time: $time
      date: $date
      k: $k
      like: $like
      disLike: $disLike
    }''';
  }
}
