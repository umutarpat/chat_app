import 'package:chat_app/global/utils/validations/input_formatters.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPagePasswordRepeatTextField extends StatelessWidget {
  const SignupPagePasswordRepeatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        (val) {
          final originalPassword = FormBuilder.of(
            context,
          )?.fields['password']?.value;

          if (originalPassword != val) {
            return l10n.passwordDontMatch;
          }

          return null;
        },
      ]),
      name: "passwordrepeat",
      inputFormatters: [
        dontAllowSpaceInputFormatter,
        dontAllowEmojiInputFormatter,
      ],
      decoration: InputDecoration(
        hintText: l10n.repeatPassword,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
