part of 'user_bloc.dart';

sealed  class UserState extends Equatable {
  const UserState();
}

///This is the loading state to show when an event starts
class UserLoading extends UserState{
  @override

  List<Object?> get props => [];
}

///This is the state to be shown when user data has been gotten
class UserLoaded extends UserState{
  const UserLoaded({this.user = const User()});

  final User user;

  @override
  List<Object?> get props => [user];

}

///This is the Error state
class UserError extends UserState {
  @override
  List<Object> get props => [];
}