part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {}

class SignupRequested extends SignupEvent {
  final User user;
  SignupRequested({required this.user});

  @override
  List<Object?> get props => [user];
}
