import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:match_bet/repositories/post_repositories/entity/post_entity.dart';
import 'package:match_bet/repositories/post_repositories/models/post_model.dart';
import 'package:match_bet/repositories/post_repositories/post_repo.dart';
import 'package:uuid/uuid.dart';

class FirebasePostRepository implements PostRepository {
  final postsCollection = FirebaseFirestore.instance.collection('posts');
  @override
  Future<Post> createPost(Post post) async {
    try {
      post.postId = const Uuid().v1();
      post.createAt = DateTime.now();
      post.like = 0;
      post.disLike = 0;
      await postsCollection.doc(post.postId).set(post.toEntity().toDocument());
      return post;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Post>> getePost() {
    try {
      return postsCollection.get().then((value) => value.docs
          .map((e) => Post.fromEntity(PostEntity.formDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
