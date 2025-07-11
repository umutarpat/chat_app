import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_bloc_state.freezed.dart';

@freezed
abstract class SettingsBlocState with _$SettingsBlocState {
  factory SettingsBlocState({bool? isLoading}) = _SettingsBlocState;
}
