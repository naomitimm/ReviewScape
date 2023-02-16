import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<LoginRequested>(_handleLoginRequest);
  }

  void _handleLoginRequest(LoginRequested event, Emitter emit) async {
    try {
      emit(const LoggingIn());
      await Future.delayed(const Duration(seconds: 2));
      emit(const LoginSuccesful());
    } on Exception catch (error) {
      emit(LoginFailed(error: error));
      return;
    }
  }
}
