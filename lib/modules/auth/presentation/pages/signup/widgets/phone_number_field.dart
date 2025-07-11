import 'package:chat_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class SignupPagePhoneNumberField extends StatelessWidget {
  const SignupPagePhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FormBuilderPhoneField(
      name: 'phone_number',
      decoration: InputDecoration(
        isDense: true,
        hintText: l10n.phoneNumber,
        filled: true,
        fillColor: Colors.white,
      ),
      priorityListByIsoCode: ['DE', 'US', 'FR', 'TR', 'GB'],
      defaultSelectedCountryIsoCode: 'DE',
      valueTransformer: (val) {
        if (val == null) {
          return null;
        }
        return PhoneNumber.parse(val, callerCountry: IsoCode.DE);
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: l10n.cannotBeEmpty),
        (val) {
          final phoneNumber =
              (FormBuilder.of(context)?.fields['phone_number'])
                  as FormBuilderPhoneFieldState;

          final frPhone1 = PhoneNumber.parse(phoneNumber.fullNumber);

          if (!frPhone1.isValid()) {
            return l10n.phoneNumberNotValid;
          }

          return null;
        },
      ]),
    );
  }
}
