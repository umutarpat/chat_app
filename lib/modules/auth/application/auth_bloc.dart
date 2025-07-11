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

  AuthBloc(this.setupApp, this.loginUseCase) : super(AuthBlocState()) {
    on<SetupUserEvent>((event, emit) async {
      await setupApp.call();
    });
    on<LoginEvent>((event, emit) async {
      final result = await loginUseCase.call(event.email, event.password);
      switch (result) {
        case LoginSuccess():
          emit(state.copyWith(loginSuccessful: true));
          break;
        case LoginFailure(:final message):
          emit(state.copyWith(errorText: message));
          break;
      }
    });
  }
}
