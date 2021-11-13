import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/services/repositories/get_all_users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUsers getAllUser;

  UserCubit({@required this.getAllUser}) : super(UserInitial());

  Future<void> getAllUsers() async {
    emit(UserLoading());
    try {
      final userData = await getAllUser.call();
      emit(UserLoaded(userData));
    } catch (_) {
      emit(UserFailure());
    }
  }
}
