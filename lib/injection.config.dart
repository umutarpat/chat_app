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

import 'modules/auth/application/auth_bloc.dart' as _i826;
import 'modules/auth/application/auth_bloc_usecase.dart' as _i762;
import 'modules/auth/data/auth_repository.dart' as _i715;
import 'modules/auth/domain/repositories/auth_repository_interface.dart'
    as _i517;
import 'modules/settings/application/settings_bloc.dart' as _i79;
import 'modules/settings/application/settings_bloc_usecase.dart' as _i1066;
import 'modules/settings/data/settings_repository.dart' as _i831;
import 'modules/settings/domain/repositories/settings_repository_interface.dart'
    as _i510;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i831.SettingsRepository>(
      () => _i831.SettingsRepository(),
    );
    gh.lazySingleton<_i517.AuthRepositoryInterface>(
      () => _i715.AuthRepository(),
    );
    gh.factory<_i1066.SettingsBlocLogoutUseCase>(
      () => _i1066.SettingsBlocLogoutUseCase(
        gh<_i510.SettingsRepositoryInterface>(),
      ),
    );
    gh.factory<_i79.SettingsBloc>(
      () => _i79.SettingsBloc(gh<_i1066.SettingsBlocLogoutUseCase>()),
    );
    gh.factory<_i762.AuthBlocSetupUserUseCase>(
      () => _i762.AuthBlocSetupUserUseCase(gh<_i517.AuthRepositoryInterface>()),
    );
    gh.factory<_i762.AuthBlocLoginUseCase>(
      () => _i762.AuthBlocLoginUseCase(gh<_i517.AuthRepositoryInterface>()),
    );
    gh.factory<_i762.AuthBlocSetLoggedInUseCase>(
      () =>
          _i762.AuthBlocSetLoggedInUseCase(gh<_i517.AuthRepositoryInterface>()),
    );
    gh.factory<_i762.AuthBlocResetPasswordUseCase>(
      () => _i762.AuthBlocResetPasswordUseCase(
        gh<_i517.AuthRepositoryInterface>(),
      ),
    );
    gh.factory<_i826.AuthBloc>(
      () => _i826.AuthBloc(
        gh<_i762.AuthBlocSetupUserUseCase>(),
        gh<_i762.AuthBlocLoginUseCase>(),
        gh<_i762.AuthBlocResetPasswordUseCase>(),
        gh<_i762.AuthBlocSetLoggedInUseCase>(),
      ),
    );
    return this;
  }
}
