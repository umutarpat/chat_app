sealed class SettingsBlocEvent {}

final class LogoutEvent extends SettingsBlocEvent {
  final bool isLoggedIn;

  LogoutEvent({required this.isLoggedIn});
}
