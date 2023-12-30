import 'package:match_bet/repositories/auth_repositories/models/my_user_model.dart';
import 'package:match_bet/repositories/post_repositories/entity/post_entity.dart';

class Post {
  String postId;
  String post;
  DateTime createAt;
  MyUser myUser;
  String team1;
  String team2;
  String nameBet;
  String time;
  String date;
  String k;
  int like;
  int disLike;

  Post({
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

  static final empty = Post(
    postId: '',
    post: '',
    createAt: DateTime.now(),
    myUser: MyUser.empty,
    team1: '',
    team2: '',
    nameBet: '',
    time: '',
    date: '',
    k: '',
    like: 0,
    disLike: 0,
  );
  Post copyWith({
    final String? postId,
    final String? post,
    final DateTime? createAt,
    final MyUser? myUser,
    final String? team1,
    final String? team2,
    final String? nameBet,
    final String? time,
    final String? date,
    final String? k,
    final int? like,
    final int? disLike,
  }) {
    return Post(
      postId: postId ?? this.postId,
      post: post ?? this.post,
      createAt: createAt ?? this.createAt,
      myUser: myUser ?? this.myUser,
      team1: team1 ?? this.team1,
      team2: team2 ?? this.team2,
      nameBet: nameBet ?? this.nameBet,
      time: time ?? this.time,
      date: date ?? this.date,
      k: k ?? this.k,
      like: like ?? this.like,
      disLike: disLike ?? this.disLike,
    );
  }

  bool get isEmpty => this == Post.empty;
  bool get isNotEmpty => this != Post.empty;

  PostEntity toEntity() {
    return PostEntity(
      postId: postId,
      post: post,
      createAt: createAt,
      myUser: myUser,
      team1: team1,
      team2: team2,
      nameBet: nameBet,
      time: time,
      date: date,
      k: k,
      like: like,
      disLike: disLike,
    );
  }

  static Post fromEntity(PostEntity entity) {
    return Post(
      postId: entity.postId,
      post: entity.post,
      createAt: entity.createAt,
      myUser: entity.myUser,
      team1: entity.team1,
      team2: entity.team2,
      nameBet: entity.nameBet,
      time: entity.time,
      date: entity.date,
      k: entity.k,
      like: entity.like,
      disLike: entity.disLike,
    );
  }

  @override
  String toString() {
    return '''Post: {
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
