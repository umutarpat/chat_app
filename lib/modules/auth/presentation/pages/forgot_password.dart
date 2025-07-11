import 'package:chat_app/global/themes/extensions/design_colors.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/auth/application/auth_bloc.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final Color cardColor = Theme.of(
      context,
    ).extension<DesignColors>()!.cardColor!;

    return Scaffold(
      backgroundColor: cardColor,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: const Color.fromARGB(255, 28, 97, 218),
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
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 48,
                      right: 48,
                      top: 48,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      spacing: 16,
                      children: [
                        Column(
                          spacing: 16,
                          children: [
                            FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: l10n.emailProvideValid,
                                ),
                                FormBuilderValidators.email(
                                  errorText: l10n.emailInvalid,
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

                        Column(
                          spacing: 16,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.saveAndValidate()) {
                                  final formData = _formKey.currentState!.value;

                                  context.read<AuthBloc>().add(
                                    LoginEvent(
                                      email: formData['email'],
                                      password: formData['password'],
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
                        ),
                      ],
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
