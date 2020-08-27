part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginStateError extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginStateUserCreated extends LoginState {
  final String name;

  const LoginStateUserCreated(this.name) : assert(name != null);

  @override
  List<Object> get props => [name];
}
