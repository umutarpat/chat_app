import 'package:chat_app/modules/auth/application/auth_bloc_event.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_state.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_usecase.dart';
import 'package:chat_app/modules/auth/domain/entities/login_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthBlocSetupUserUseCase setupApp;
  final AuthBlocLoginUseCase loginUseCase;
  final AuthBlocResetPasswordUseCase resetPasswordUseCase;
  final AuthBlocSetLoggedInUseCase setLoggedInUseCase;

  AuthBloc(
    this.setupApp,
    this.loginUseCase,
    this.resetPasswordUseCase,
    this.setLoggedInUseCase,
  ) : super(AuthBlocState()) {
    on<SetupUserEvent>((event, emit) async {
      await setupApp.call();
    });
    on<LoginEvent>((event, emit) async {
      final result = await loginUseCase.call(event.email, event.password);

      // if user logged in, set logged in to true in settings table on database
      if (result is LoginSuccess) {
        await setLoggedInUseCase.call(true);
      }
      emit(state.copyWith(loginResult: result));
    });
    on<ResetPasswordEvent>((event, emit) async {
      final result = await resetPasswordUseCase.call(event.email);

      emit(state.copyWith(forgotPasswordResult: result));
    });
  }
}
