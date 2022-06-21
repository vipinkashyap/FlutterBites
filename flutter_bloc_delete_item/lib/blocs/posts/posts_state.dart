part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;

  const PostsLoaded(this.posts);
}

class ConfirmPostDelete extends PostsState {
  final Post selectedPost;
  final List<Post> existingPosts;

  const ConfirmPostDelete(
      {required this.selectedPost, required this.existingPosts});
}

class PostDeleted extends PostsState {}
