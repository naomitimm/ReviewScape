part of 'logout_bloc.dart';

@immutable
abstract class LogoutEvent extends Equatable {}

class LogoutRequested extends LogoutEvent {
  @override
  List<Object?> get props => [];
}
