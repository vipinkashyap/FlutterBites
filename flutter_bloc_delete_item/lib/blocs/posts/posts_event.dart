part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

// #1 Event to fetch data
class PostsFetched extends PostsEvent {}

// #2 Event to show dialogue
class ConfirmPostDeletion extends PostsEvent {
  final Post selectedPost;
  final List<Post> existingPosts;

  const ConfirmPostDeletion(
      {required this.selectedPost, required this.existingPosts});
}

// #3 Event to delete post
class DeletePost extends PostsEvent {
  final Post selectedPost;
  final List<Post> existingPosts;

  const DeletePost({required this.selectedPost, required this.existingPosts});
}
