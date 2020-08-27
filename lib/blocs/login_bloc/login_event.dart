part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class AddNewUserEvent extends LoginEvent {
  final String username;

  const AddNewUserEvent(this.username) : assert(username != null);

  @override
  List<Object> get props => [];
}
