import 'package:facebook_flutter/services/repositories/get_all_posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:facebook_flutter/services/classes/post.dart';
part 'post_state.dart';


class PostCubit extends Cubit<PostState> {
  final GetAllPosts getAllPost;

  PostCubit({@required this.getAllPost}) : super(PostInitial());

  Future<void> getAllPosts() async {
    emit(PostLoading());
    try {
      final postData = await getAllPost.call();
      emit(PostLoaded(postData));
    } catch (_) {
      emit(PostFailure());
    }
  }
}
