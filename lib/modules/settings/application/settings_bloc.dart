import 'package:chat_app/modules/settings/application/settings_bloc_event.dart';
import 'package:chat_app/modules/settings/application/settings_bloc_state.dart';
import 'package:chat_app/modules/settings/application/settings_bloc_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsBloc extends Bloc<SettingsBlocEvent, SettingsBlocState> {
  final SettingsBlocLogoutUseCase logoutUseCase;

  SettingsBloc(this.logoutUseCase) : super(SettingsBlocState()) {
    on<LogoutEvent>((event, emit) async {
      final result = await logoutUseCase.call(event.isLoggedIn);
      emit(state.copyWith(logoutResult: result));
    });
  }
}
