import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/user.dart';
import '../services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<GetUserEvent, UserState> {
  UserBloc() : super(UserLoading()) {
    on<GetUser>(_onGetUser);
  }

  final UserService userService = UserService.instance;

  Future<void> _onGetUser(GetUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final result = await userService.getUser();
      emit(UserLoaded(user: result));
    } catch (_) {
      emit(UserError());
    }
  }
}