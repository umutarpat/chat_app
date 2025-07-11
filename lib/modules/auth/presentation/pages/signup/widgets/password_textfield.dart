import 'package:chat_app/global/themes/extensions/design_text_styles.dart';
import 'package:chat_app/global/utils/validations/input_formatters.dart';
import 'package:chat_app/global/utils/validations/password_validator.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPagePasswordTextField extends StatelessWidget {
  const SignupPagePasswordTextField({super.key});
  // At least 8 characters
  // At least 1 uppercase letter
  // At least 1 number
  // At least 1 special character

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: l10n.passwordProvideValid),

        (val) {
          return getPasswordValidations(val!, context);
        },
      ]),
      inputFormatters: [
        dontAllowSpaceInputFormatter,
        dontAllowEmojiInputFormatter,
      ],
      errorBuilder: (context, errorText) {
        return Text(
          errorText,
          style: Theme.of(
            context,
          ).extension<DesignTextStyles>()?.fieldErrorTextStyle,
        );
      },
      name: "password",
      decoration: InputDecoration(
        hintText: l10n.password,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
