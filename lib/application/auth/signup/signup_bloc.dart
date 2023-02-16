import 'package:equatable/equatable.dart';
import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupInitial()) {
    on<SignupRequested>(_handleSignupRequest);
  }

  void _handleSignupRequest(SignupRequested event, Emitter emit) async {
    try {
      emit(const SigningUp());
      await Future.delayed(const Duration(seconds: 2));
      emit(SignupSuccessful(loggedUser: event.user));
    } on Error catch (error) {
      emit(SignupFailed(error: error));
      return;
    }
  }
}
