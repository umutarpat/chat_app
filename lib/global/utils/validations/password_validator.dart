import 'package:chat_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

String? getPasswordValidations(String val, BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  var validations = getRegexValidations(
    val: val,
    regExp: [
      // Create a list of checked regex requests
      RegExpModel(
        regExp: RegExp(r'[A-Z]'),
        status: false,
        errorText: "\n* ${l10n.atLeastOneCapitalLetter}",
      ),

      RegExpModel(minLength: 8, errorText: "\n* ${l10n.atLeastEightChars}"),
      RegExpModel(maxLength: 32, errorText: "\n* ${l10n.maxThirdyTwoChars}"),
      RegExpModel(
        regExp: RegExp(
          r'.*[!\"#$%&()*+,-./:;<=>?@\[\]^_`{|}~'
          "'"
          '].*',
        ),
        status: false,
        errorText: "\n* ${l10n.atLeastOneSpecialChar}",
      ),
      RegExpModel(
        regExp: RegExp(r'.*\d+.*'),
        status: false,
        errorText: "\n* ${l10n.atLeastOneNumber}",
      ),
    ],
  );
  if (validations != null) return validations;
  return null;
}

String? getRegexValidations({
  required List<RegExpModel>? regExp,
  required String? val,
}) {
  if (val != null) {
    String errorText = "";
    if (regExp != null) {
      for (int i = 0; i < regExp.length; i++) {
        // Checks minimum length for string
        if (regExp[i].minLength != null && val.length < regExp[i].minLength!) {
          // Add error to static string
          errorText = (errorText + regExp[i].errorText);
        }
        // Checks max length for string

        if (regExp[i].maxLength != null && val.length > regExp[i].maxLength!) {
          // Add error to static string
          errorText = (errorText + regExp[i].errorText);
        }
        // Checks regular expression match and compares with incoming boolean
        if (regExp[i].regExp != null &&
            val.contains(regExp[i].regExp!) == regExp[i].status) {
          // Add error to static string
          errorText = (errorText + regExp[i].errorText);
        }
      }
    }

    return errorText.isNotEmpty ? errorText : null;
  }
  return null;
}

class RegExpModel {
  RegExp? regExp;
  bool? status;
  String errorText;
  int? minLength;
  int? maxLength;
  RegExpModel({
    this.regExp,
    this.maxLength,
    this.status,
    required this.errorText,
    this.minLength,
  });
}
