import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @repeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat Password'**
  String get repeatPassword;

  /// No description provided for @emailProvideValid.
  ///
  /// In en, this message translates to:
  /// **'Please provide a valid email.'**
  String get emailProvideValid;

  /// No description provided for @passwordProvideValid.
  ///
  /// In en, this message translates to:
  /// **'Please provide a valid password.'**
  String get passwordProvideValid;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'This field requires a valid email address.'**
  String get emailInvalid;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @sendResetPasswordEmail.
  ///
  /// In en, this message translates to:
  /// **'Send reset password email'**
  String get sendResetPasswordEmail;

  /// No description provided for @emailNotRegistered.
  ///
  /// In en, this message translates to:
  /// **'Email not registered.'**
  String get emailNotRegistered;

  /// No description provided for @resetPasswordEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Reset password email has been sent.'**
  String get resetPasswordEmailSent;

  /// No description provided for @loginSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Trying to login...'**
  String get loginSuccessful;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'Email or password doesnt exist.'**
  String get loginError;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @firstname.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstname;

  /// No description provided for @lastname.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastname;

  /// No description provided for @cannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Cannot be empty.'**
  String get cannotBeEmpty;

  /// No description provided for @lettersOnly.
  ///
  /// In en, this message translates to:
  /// **'Should be letters only.'**
  String get lettersOnly;

  /// No description provided for @atLeastEightChars.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters.'**
  String get atLeastEightChars;

  /// No description provided for @atLeastOneNumber.
  ///
  /// In en, this message translates to:
  /// **'At least 1 number.'**
  String get atLeastOneNumber;

  /// No description provided for @atLeastOneCapitalLetter.
  ///
  /// In en, this message translates to:
  /// **'At least 1 capital letter.'**
  String get atLeastOneCapitalLetter;

  /// No description provided for @atLeastOneSpecialChar.
  ///
  /// In en, this message translates to:
  /// **'At least 1 special character (+/*#)'**
  String get atLeastOneSpecialChar;

  /// No description provided for @maxThirdyTwoChars.
  ///
  /// In en, this message translates to:
  /// **'Max 32 characters.'**
  String get maxThirdyTwoChars;

  /// No description provided for @passwordDontMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match.'**
  String get passwordDontMatch;

  /// No description provided for @accountType.
  ///
  /// In en, this message translates to:
  /// **'Account Type'**
  String get accountType;

  /// No description provided for @accountTypePersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get accountTypePersonal;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @phoneNumberNotValid.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number.'**
  String get phoneNumberNotValid;

  /// No description provided for @userAlreadyExist.
  ///
  /// In en, this message translates to:
  /// **'This user already exists.'**
  String get userAlreadyExist;

  /// No description provided for @registerSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Register successful, please check your email for verification link.'**
  String get registerSuccessful;

  /// No description provided for @noChatsYet.
  ///
  /// In en, this message translates to:
  /// **'No chats yet.'**
  String get noChatsYet;

  /// No description provided for @newChat.
  ///
  /// In en, this message translates to:
  /// **'New Chat'**
  String get newChat;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @permissionsNeededTitle.
  ///
  /// In en, this message translates to:
  /// **'Permissions Needed'**
  String get permissionsNeededTitle;

  /// No description provided for @micAndCameraPermissionsEnable.
  ///
  /// In en, this message translates to:
  /// **'Please enable camera and microphone permissions in Settings to join the meeting.'**
  String get micAndCameraPermissionsEnable;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @feed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get feed;

  /// No description provided for @noPostsYet.
  ///
  /// In en, this message translates to:
  /// **'No posts yet.'**
  String get noPostsYet;

  /// No description provided for @postCreationSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Post created successfully!'**
  String get postCreationSuccessful;

  /// No description provided for @postCreationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create post.'**
  String get postCreationFailed;

  /// No description provided for @newPost.
  ///
  /// In en, this message translates to:
  /// **'New Post'**
  String get newPost;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @optionalImage.
  ///
  /// In en, this message translates to:
  /// **'Image (Optional)'**
  String get optionalImage;

  /// No description provided for @changeImage.
  ///
  /// In en, this message translates to:
  /// **'Change Image'**
  String get changeImage;

  /// No description provided for @addImage.
  ///
  /// In en, this message translates to:
  /// **'Add Image'**
  String get addImage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @createPost.
  ///
  /// In en, this message translates to:
  /// **'Create Post'**
  String get createPost;

  /// No description provided for @todo.
  ///
  /// In en, this message translates to:
  /// **'Todo'**
  String get todo;

  /// No description provided for @addNewTodo.
  ///
  /// In en, this message translates to:
  /// **'Add New Todo'**
  String get addNewTodo;

  /// No description provided for @addTodo.
  ///
  /// In en, this message translates to:
  /// **'Add Todo'**
  String get addTodo;

  /// No description provided for @noTodosYet.
  ///
  /// In en, this message translates to:
  /// **'No todos yet.'**
  String get noTodosYet;

  /// No description provided for @todoCreated.
  ///
  /// In en, this message translates to:
  /// **'Todo created successfully!'**
  String get todoCreated;

  /// No description provided for @todoCreationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create todo.'**
  String get todoCreationFailed;

  /// No description provided for @maxFortyChars.
  ///
  /// In en, this message translates to:
  /// **'Max 40 characters.'**
  String get maxFortyChars;

  /// No description provided for @maxTwoHunderedChars.
  ///
  /// In en, this message translates to:
  /// **'Max 200 characters.'**
  String get maxTwoHunderedChars;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
