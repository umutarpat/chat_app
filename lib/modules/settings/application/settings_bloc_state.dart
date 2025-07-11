import 'package:chat_app/modules/settings/domain/entities/logout_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_bloc_state.freezed.dart';

@freezed
abstract class SettingsBlocState with _$SettingsBlocState {
  factory SettingsBlocState({LogoutResult? logoutResult}) = _SettingsBlocState;
}
