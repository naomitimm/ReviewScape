import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String fullName;
  final String userName;
  final String email;
  const User(
      {required this.email, required this.fullName, required this.userName});

  @override
  List<Object?> get props => [email, fullName, userName];
}
