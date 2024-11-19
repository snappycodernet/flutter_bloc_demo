part of 'user_bloc.dart';

abstract class GetUserEvent extends Equatable {
  const GetUserEvent();
}

class GetUser extends GetUserEvent{
  @override
  List<Object?> get props => [];
}