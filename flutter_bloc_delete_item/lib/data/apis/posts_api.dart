import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class PostsApi {
  final Uri postsUri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final http.Client httpClient = http.Client();

  Uri postUri(String id) =>
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');

  Future<List<Post>> fetchPosts() async {
    var response = await httpClient.get(postsUri);
    if (response.statusCode == 200) {
      var postsAsString = jsonDecode(response.body) as List<dynamic>;
      return postsAsString.map((strPost) => Post.fromJson(strPost)).toList();
    }
    throw Exception();
  }

  Future<bool> deletePost({required int id}) async {
    try {
      await http.delete(postUri(id.toString()));
      return true;
    } catch (e) {
      return false;
    }
  }
}
