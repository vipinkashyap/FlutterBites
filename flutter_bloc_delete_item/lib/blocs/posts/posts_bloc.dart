import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_delete_item/data/data.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository = PostsRepository();
  PostsBloc() : super(PostsInitial()) {
    on<PostsFetched>(_onPostsFetched);
    on<ConfirmPostDeletion>(_onConfirmPostDeletion);
    on<DeletePost>(_onDeletePost);
  }

  void _onPostsFetched(PostsFetched event, emit) async {
    emit(PostsLoading());

    List<Post> posts = await postsRepository.fetchPosts();

    emit(PostsLoaded(posts));
  }

  void _onConfirmPostDeletion(ConfirmPostDeletion event, emit) async {
    emit(ConfirmPostDelete(
        selectedPost: event.selectedPost, existingPosts: event.existingPosts));
  }

  void _onDeletePost(DeletePost event, emit) async {
    emit(PostsLoading());
    bool isDeleteDone =
        await postsRepository.deletePost(id: event.selectedPost.id);

    List<Post> updatedPosts = event.existingPosts
        .where((post) => post.id != event.selectedPost.id)
        .toList();
    emit(PostDeleted());
    isDeleteDone
        ? emit(PostsLoaded(updatedPosts))
        : emit(PostsLoaded(event.existingPosts));
  }
}
