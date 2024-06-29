part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostEntity> posts;

  PostLoaded({
    required this.posts,
  });
}

class PostError extends PostState {
  final String error;

  PostError({
    required this.error,
  });
}
