import 'package:chat_app/global/themes/extensions/design_text_styles.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPageFirstNameTextField extends StatelessWidget {
  const SignupPageFirstNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: l10n.cannotBeEmpty),
        FormBuilderValidators.alphabetical(errorText: l10n.lettersOnly),
        FormBuilderValidators.maxLength(32, errorText: l10n.maxThirdyTwoChars),
      ]),
      errorBuilder: (context, errorText) {
        return Text(
          errorText,
          style: Theme.of(
            context,
          ).extension<DesignTextStyles>()?.fieldErrorTextStyle,
        );
      },
      name: "firstname",
      decoration: InputDecoration(
        hintText: l10n.firstname,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
