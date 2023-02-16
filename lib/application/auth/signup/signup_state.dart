part of 'signup_bloc.dart';

@immutable
abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {
  const SignupInitial();

  @override
  List<Object?> get props => [];
}

class SigningUp extends SignupState {
  const SigningUp();
  @override
  List<Object?> get props => [];
}

class SignupSuccessful extends SignupState {
  final User? loggedUser;
  const SignupSuccessful({required this.loggedUser});

  @override
  List<Object?> get props => [];
}

class SignupFailed extends SignupState {
  const SignupFailed({required this.error});

  final Error error;

  @override
  List<Object?> get props => [];
}
