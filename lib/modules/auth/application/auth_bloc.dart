import 'package:chat_app/modules/auth/application/auth_bloc_event.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_state.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthBlocSetupUserUseCase setupApp;
  final AuthBlocLoginUseCase loginUseCase;
  final AuthBlocResetPasswordUseCase resetPasswordUseCase;

  AuthBloc(this.setupApp, this.loginUseCase, this.resetPasswordUseCase)
    : super(AuthBlocState()) {
    on<SetupUserEvent>((event, emit) async {
      await setupApp.call();
    });
    on<LoginEvent>((event, emit) async {
      final result = await loginUseCase.call(event.email, event.password);
      emit(state.copyWith(loginResult: result));
    });
    on<ResetPasswordEvent>((event, emit) async {
      final result = await resetPasswordUseCase.call(event.email);

      emit(state.copyWith(forgotPasswordResult: result));
    });
  }
}
