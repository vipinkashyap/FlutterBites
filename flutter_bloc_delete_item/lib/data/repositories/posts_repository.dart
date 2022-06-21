import 'package:flutter_bloc_delete_item/data/apis/apis.dart';
import 'package:http/http.dart';

import '../models/models.dart';

class PostsRepository {
  final PostsApi postsApi = PostsApi();

  Future<List<Post>> fetchPosts() async {
    return await postsApi.fetchPosts();
  }

  Future<bool> deletePost({required int id}) async {
    return await postsApi.deletePost(id: id);
  }
}
