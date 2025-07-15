import 'package:chat_app/global/themes/extensions/design_colors.dart';
import 'package:chat_app/global/themes/extensions/design_text_styles.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/auth/application/auth_bloc.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_event.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_state.dart';
import 'package:chat_app/modules/auth/domain/entities/signup_result.dart';
import 'package:chat_app/modules/auth/presentation/pages/signup/widgets/account_type_dropdown.dart';
import 'package:chat_app/modules/auth/presentation/pages/signup/widgets/email_textfield.dart';
import 'package:chat_app/modules/auth/presentation/pages/signup/widgets/first_name_textfield.dart';
import 'package:chat_app/modules/auth/presentation/pages/signup/widgets/last_name_textfield.dart';
import 'package:chat_app/modules/auth/presentation/pages/signup/widgets/password_repeat_textfield.dart';
import 'package:chat_app/modules/auth/presentation/pages/signup/widgets/password_textfield.dart';
import 'package:chat_app/modules/auth/presentation/pages/signup/widgets/phone_number_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class SignupPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final Color backgroundImageFillColor = const Color.fromARGB(255, 28, 97, 218);

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final Color cardColor = Theme.of(
      context,
    ).extension<DesignColors>()!.cardColor!;

    final safePaddingTop = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: cardColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,

        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: backgroundImageFillColor,
                width: double.infinity,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(top: safePaddingTop),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: FormBuilder(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.all(0),
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.85,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 48,
                        right: 48,
                        top: 48,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                      ),
                      child: BlocBuilder<AuthBloc, AuthBlocState>(
                        builder: (context, state) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            spacing: 16,
                            children: [
                              if (state.signupResult is UserAlreadyExists)
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).extension<DesignColors>()!.cardErrorColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    l10n.userAlreadyExist,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),

                              if (state.signupResult is SignupSuccess)
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .extension<DesignColors>()!
                                        .cardSuccessColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      l10n.registerSuccessful,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),

                              Column(
                                spacing: 16,
                                children: [
                                  Row(
                                    spacing: 16,
                                    children: [
                                      Flexible(
                                        child: SignupPageFirstNameTextField(),
                                      ),
                                      Flexible(
                                        child: SignupPageLastNameTextField(),
                                      ),
                                    ],
                                  ),
                                  SignupPageEmailTextField(),
                                  SignupPagePasswordTextField(),
                                  SignupPagePasswordRepeatTextField(),
                                  SignupPageAccountTypeDropdown(),
                                  SignupPagePhoneNumberField(),
                                ],
                              ),

                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!
                                      .saveAndValidate()) {
                                    final formData =
                                        _formKey.currentState!.value;

                                    final number =
                                        formData['phone_number'] as PhoneNumber;

                                    context.read<AuthBloc>().add(
                                      SignupEvent(
                                        email: formData['email'],
                                        firstName: formData['firstname'],
                                        lastName: formData['lastname'],
                                        password: formData['password'],
                                        accountType: formData['accounttype'],
                                        phoneNumber: number.international,
                                      ),
                                    );
                                  }
                                },

                                child: SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: Center(
                                    child: Text(
                                      l10n.signup,
                                      style: Theme.of(context)
                                          .extension<DesignTextStyles>()
                                          ?.buttonTextStyle
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
