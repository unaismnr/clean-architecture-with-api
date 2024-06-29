import 'package:clean_arch_project/core/color_const.dart';
import 'package:clean_arch_project/features/application/blocs/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              context.read<PostBloc>().add(
                    FetchPostEvent(),
                  );
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostLoaded) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return Card(
                    color: mainGreen,
                    elevation: 0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text('${index + 1}'),
                      ),
                      title: Text(post.title),
                      subtitle: Text(
                        post.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(),
                itemCount: state.posts.length,
              );
            } else if (state is PostError) {
              return Center(child: Text(state.error));
            }
            return const Center(child: Text('No Data'));
          },
        ),
      ),
    );
  }
}
