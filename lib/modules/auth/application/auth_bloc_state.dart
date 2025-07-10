import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc_state.freezed.dart';

@freezed
abstract class AuthBlocState with _$AuthBlocState {
  factory AuthBlocState({@Default(true) bool? isLoading}) = _AuthBlocState;
}
