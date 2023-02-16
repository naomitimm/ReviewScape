part of 'logout_bloc.dart';

@immutable
abstract class LogoutState extends Equatable {}

class LogoutInitial extends LogoutState {
  @override
  List<Object?> get props => [];
}

class Loggingout extends LogoutState {
  @override
  List<Object?> get props => [];
}

class LogoutSuccessful extends LogoutState {
  @override
  List<Object?> get props => [];
}

class Logoutfailed extends LogoutState {
  final Exception error;
  Logoutfailed({required this.error});
  @override
  List<Object?> get props => [error];
}
