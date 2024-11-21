part of 'post_bloc.dart';

sealed  class PostState extends Equatable {
  const PostState();
}

///This is the loading state to show when an event starts
class PostsLoading extends PostState{
  @override

  List<Object?> get props => [];
}

///This is the state to be shown when user data has been gotten
class PostsLoaded extends PostState{
  const PostsLoaded({required this.posts});

  final List<Post> posts;

  @override
  List<Object?> get props => [posts];

}

///This is the Error state
class PostError extends PostState {
  @override
  List<Object> get props => [];
}