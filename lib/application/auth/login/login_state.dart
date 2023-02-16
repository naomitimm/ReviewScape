part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object?> get props => [];
}

class LoggingIn extends LoginState {
  const LoggingIn();

  @override
  List<Object?> get props => [];
}

class LoginSuccesful extends LoginState {
  const LoginSuccesful();

  @override
  List<Object?> get props => [];
}

class LoginFailed extends LoginState {
  const LoginFailed({required this.error});

  final Exception error;

  @override
  List<Object?> get props => [error];
}
