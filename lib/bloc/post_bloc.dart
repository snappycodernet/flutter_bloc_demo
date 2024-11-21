import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/post.dart';
import '../services/post_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostsEvent, PostState> {
  PostBloc() : super(PostsLoading()) {
    on<GetUserPosts>(_onGetUserPosts);
  }

  final PostService postService = PostService.instance;

  Future<void> _onGetUserPosts(GetUserPosts event, Emitter<PostState> emit) async {
    emit(PostsLoading());

    try {
      final result = await postService.getUserPosts(event.userId);
      emit(PostsLoaded(posts: result));
    } catch (_) {
      emit(PostError());
    }
  }
}