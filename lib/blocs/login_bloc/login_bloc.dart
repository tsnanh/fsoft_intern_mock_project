import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fsoft_intern_mock_project/network/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  final repository = Repository();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is AddNewUserEvent) {
      try {
        yield LoginStateUserCreated(await repository.login(event.username));
      } catch (e) {
        print(e);
        yield LoginStateError();
      }
    }
  }
}
