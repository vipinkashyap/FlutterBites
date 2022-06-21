import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocConsumer<PostsBloc, PostsState>(
        listener: (context, state) {
          if (state is ConfirmPostDelete) {
            showAlertDialog(context, state);
          }
        },
        builder: (context, state) {
          if (state is PostsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostsLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var post = state.posts[index];
                return ListTile(
                  leading: Text(post.id.toString()),
                  title: Text(post.title),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<PostsBloc>().add(ConfirmPostDeletion(
                          selectedPost: post, existingPosts: state.posts));
                    },
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('Unknown State'),
          );
        },
      ),
    );
  }

  Future<dynamic> showAlertDialog(
      BuildContext context, ConfirmPostDelete state) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Deletion'),
            content: Text(
                'This action will delete post ${state.selectedPost.id} : ${state.selectedPost.title}'),
            actions: [
              TextButton(
                  onPressed: () {
                    context.read<PostsBloc>().add(DeletePost(
                        selectedPost: state.selectedPost,
                        existingPosts: state.existingPosts));

                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
}
