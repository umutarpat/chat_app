import 'package:chat_app/modules/auth/application/auth_bloc_event.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_state.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthBlocSetupUserUseCase setupApp;

  AuthBloc(this.setupApp) : super(AuthBlocState(isLoading: true)) {
    on<SetupUserEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await setupApp.call();
      emit(state.copyWith(isLoading: false));
    });
  }
}
