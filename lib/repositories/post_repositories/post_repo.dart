import 'package:match_bet/repositories/post_repositories/models/post_model.dart';

abstract class PostRepository {
  Future<Post> createPost(Post post);
  Future<List<Post>> getePost();
}
