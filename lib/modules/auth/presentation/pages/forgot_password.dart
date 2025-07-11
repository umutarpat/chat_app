import 'package:chat_app/global/themes/extensions/design_colors.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/auth/application/auth_bloc.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_event.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_state.dart';
import 'package:chat_app/modules/auth/domain/entities/forgot_password_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final Color backgroundImageFillColor = const Color.fromARGB(255, 28, 97, 218);

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final Color cardColor = Theme.of(
      context,
    ).extension<DesignColors>()!.cardColor!;

    return Scaffold(
      backgroundColor: cardColor,
      appBar: AppBar(
        backgroundColor: backgroundImageFillColor,
        leading: IconButton(
          onPressed: () => context.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        ),
      ),
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
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 48,
                      right: 48,
                      top: 48,
                    ),
                    child: BlocBuilder<AuthBloc, AuthBlocState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          spacing: 16,
                          children: [
                            if (state.forgotPasswordResult
                                is ForgotPasswordUserDoesntExist)
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
                                  l10n.emailNotRegistered,
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),

                            if (state.forgotPasswordResult
                                is ForgotPasswordSuccess)
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).extension<DesignColors>()!.cardSuccessColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  l10n.resetPasswordEmailSent,
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),

                            Column(
                              spacing: 16,
                              children: [
                                FormBuilderTextField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      errorText: l10n.emailProvideValid,
                                    ),
                                    FormBuilderValidators.email(
                                      errorText: l10n.emailInvalid,
                                    ),
                                    FormBuilderValidators.maxLength(
                                      32,
                                      errorText: l10n.maxThirdyTwoChars,
                                    ),
                                  ]),
                                  name: "email",
                                  decoration: InputDecoration(
                                    hintText: l10n.email,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.saveAndValidate()) {
                                  final formData = _formKey.currentState!.value;

                                  context.read<AuthBloc>().add(
                                    ResetPasswordEvent(
                                      email: formData['email'],
                                    ),
                                  );
                                }
                              },

                              child: SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    l10n.sendResetPasswordEmail,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
    );
  }
}
