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
  String get repeatPassword => 'Repeat Password';

  @override
  String get emailProvideValid => 'Please provide a valid email.';

  @override
  String get passwordProvideValid => 'Please provide a valid password.';

  @override
  String get emailInvalid => 'This field requires a valid email address.';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get sendResetPasswordEmail => 'Send reset password email';

  @override
  String get emailNotRegistered => 'Email not registered.';

  @override
  String get resetPasswordEmailSent => 'Reset password email has been sent.';

  @override
  String get loginSuccessful => 'Trying to login...';

  @override
  String get loginError => 'Email or password doesnt exist.';

  @override
  String get logout => 'Logout';

  @override
  String get firstname => 'First Name';

  @override
  String get lastname => 'Last Name';

  @override
  String get cannotBeEmpty => 'Cannot be empty.';

  @override
  String get lettersOnly => 'Should be letters only.';

  @override
  String get atLeastEightChars => 'At least 8 characters.';

  @override
  String get atLeastOneNumber => 'At least 1 number.';

  @override
  String get atLeastOneCapitalLetter => 'At least 1 capital letter.';

  @override
  String get atLeastOneSpecialChar => 'At least 1 special character (+/*#)';

  @override
  String get maxThirdyTwoChars => 'Max 32 characters.';

  @override
  String get passwordDontMatch => 'Passwords don\'t match.';

  @override
  String get accountType => 'Account Type';

  @override
  String get accountTypePersonal => 'Personal';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get phoneNumberNotValid => 'Invalid phone number.';

  @override
  String get userAlreadyExist => 'This user already exists.';

  @override
  String get registerSuccessful =>
      'Register successful, please check your email for verification link.';

  @override
  String get newChat => 'New Chat';

  @override
  String get message => 'Message';

  @override
  String get chat => 'Chat';
}
