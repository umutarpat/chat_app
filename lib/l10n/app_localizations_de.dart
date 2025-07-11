// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get login => 'Log in';

  @override
  String get signup => 'Sign up';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get emailProvideValid => 'Please provide a valid email.';

  @override
  String get passwordProvideValid => 'Please provide a valid password.';

  @override
  String get emailInvalid => 'This field requires a valid email address.';

  @override
  String get forgotPassword => 'Forgot password?';
}
