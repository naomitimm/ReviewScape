import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutRequested>(_handleLogoutRequested);
  }

  void _handleLogoutRequested(LogoutRequested event, Emitter emit) async {
    try {
      emit(Loggingout());
      await Future.delayed(const Duration(seconds: 2));
      emit(LogoutSuccessful());
    } on Exception catch (error) {
      emit(Logoutfailed(error: error));
    }
  }
}
