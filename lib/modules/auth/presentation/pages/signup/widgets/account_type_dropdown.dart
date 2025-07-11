import 'package:chat_app/global/themes/extensions/design_text_styles.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPageAccountTypeDropdown extends StatelessWidget {
  const SignupPageAccountTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FormBuilderDropdown(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: l10n.cannotBeEmpty),
      ]),
      name: "accounttype",
      dropdownColor: Colors.white,
      hint: Text(
        l10n.accountType,
        style: Theme.of(
          context,
        ).extension<DesignTextStyles>()?.fieldHintTextStyle,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(16),
        errorStyle: Theme.of(
          context,
        ).extension<DesignTextStyles>()?.fieldErrorTextStyle,
      ),
      style: Theme.of(context).textTheme.bodyLarge,
      items: [
        DropdownMenuItem(
          value: "personal",
          child: Text(l10n.accountTypePersonal),
        ),
      ],
    );
  }
}
