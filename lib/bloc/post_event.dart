part of 'post_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
}

class GetUserPosts extends PostsEvent{
  final int userId;

  const GetUserPosts({required this.userId});

  @override
  List<Object?> get props => [];
}