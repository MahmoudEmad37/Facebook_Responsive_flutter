part of 'posts_cubit.dart';

abstract class PostState{
const PostState();
}

class PostInitial extends PostState{}

class PostLoading extends PostState{}

class PostLoaded extends PostState{
  final List<Post> posts;

  PostLoaded(this.posts);
}

class PostFailure extends PostState{}

