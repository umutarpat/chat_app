import 'package:chat_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPageEmailTextField extends StatelessWidget {
  const SignupPageEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: l10n.emailProvideValid),
        FormBuilderValidators.email(errorText: l10n.emailInvalid),
        FormBuilderValidators.maxLength(32, errorText: l10n.maxThirdyTwoChars),
      ]),
      name: "email",
      decoration: InputDecoration(
        hintText: l10n.email,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
