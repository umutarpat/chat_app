// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../modules/auth/application/auth_bloc.dart' as _i156;
import '../../modules/auth/application/auth_bloc_usecase.dart' as _i114;
import '../../modules/auth/data/auth_repository.dart' as _i927;
import '../../modules/auth/domain/repositories/auth_repository_interface.dart'
    as _i462;
import '../../modules/chat/application/chat_bloc.dart' as _i405;
import '../../modules/chat/application/chat_bloc_usecase.dart' as _i428;
import '../../modules/chat/data/chat_repository.dart' as _i199;
import '../../modules/chat/domain/repositories/chat_repository_interface.dart'
    as _i455;
import '../../modules/settings/application/settings_bloc.dart' as _i893;
import '../../modules/settings/application/settings_bloc_usecase.dart' as _i473;
import '../../modules/settings/data/settings_repository.dart' as _i55;
import '../../modules/settings/domain/repositories/settings_repository_interface.dart'
    as _i1024;
import '../domain/entities/database/database.dart' as _i875;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i875.AppDatabase>(() => appModule.provideAppDatabase());
    gh.lazySingleton<_i462.AuthRepositoryInterface>(
      () => _i927.AuthRepository(gh<_i875.AppDatabase>()),
    );
    gh.lazySingleton<_i455.ChatRepositoryInterface>(
      () => _i199.ChatRepository(gh<_i875.AppDatabase>()),
    );
    gh.factory<_i428.ChatBlocFetchUserListUseCase>(
      () => _i428.ChatBlocFetchUserListUseCase(
        gh<_i455.ChatRepositoryInterface>(),
      ),
    );
    gh.factory<_i428.ChatBlocSendMessageUseCase>(
      () =>
          _i428.ChatBlocSendMessageUseCase(gh<_i455.ChatRepositoryInterface>()),
    );
    gh.factory<_i428.ChatBlocGetMessagesUseCase>(
      () =>
          _i428.ChatBlocGetMessagesUseCase(gh<_i455.ChatRepositoryInterface>()),
    );
    gh.lazySingleton<_i1024.SettingsRepositoryInterface>(
      () => _i55.SettingsRepository(gh<_i875.AppDatabase>()),
    );
    gh.factory<_i405.ChatBloc>(
      () => _i405.ChatBloc(
        gh<_i428.ChatBlocFetchUserListUseCase>(),
        gh<_i428.ChatBlocSendMessageUseCase>(),
        gh<_i428.ChatBlocGetMessagesUseCase>(),
      ),
    );
    gh.factory<_i473.SettingsBlocLogoutUseCase>(
      () => _i473.SettingsBlocLogoutUseCase(
        gh<_i1024.SettingsRepositoryInterface>(),
      ),
    );
    gh.factory<_i893.SettingsBloc>(
      () => _i893.SettingsBloc(gh<_i473.SettingsBlocLogoutUseCase>()),
    );
    gh.factory<_i114.AuthBlocSetupUserUseCase>(
      () => _i114.AuthBlocSetupUserUseCase(gh<_i462.AuthRepositoryInterface>()),
    );
    gh.factory<_i114.AuthBlocLoginUseCase>(
      () => _i114.AuthBlocLoginUseCase(gh<_i462.AuthRepositoryInterface>()),
    );
    gh.factory<_i114.AuthBlocSetLoggedInUseCase>(
      () =>
          _i114.AuthBlocSetLoggedInUseCase(gh<_i462.AuthRepositoryInterface>()),
    );
    gh.factory<_i114.AuthBlocResetPasswordUseCase>(
      () => _i114.AuthBlocResetPasswordUseCase(
        gh<_i462.AuthRepositoryInterface>(),
      ),
    );
    gh.factory<_i114.AuthBlocSignupUseCase>(
      () => _i114.AuthBlocSignupUseCase(gh<_i462.AuthRepositoryInterface>()),
    );
    gh.factory<_i156.AuthBloc>(
      () => _i156.AuthBloc(
        gh<_i114.AuthBlocSetupUserUseCase>(),
        gh<_i114.AuthBlocLoginUseCase>(),
        gh<_i114.AuthBlocResetPasswordUseCase>(),
        gh<_i114.AuthBlocSetLoggedInUseCase>(),
        gh<_i114.AuthBlocSignupUseCase>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
