import 'package:chat_app/global/core/routes.dart';
import 'package:chat_app/global/themes/extensions/design_colors.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/auth/application/auth_bloc.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_event.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_state.dart';
import 'package:chat_app/modules/auth/domain/entities/login_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _showTextFields = false;
  bool _obscurePassword = true;
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(SetupUserEvent());

    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _heightAnimation = Tween<double>(begin: 200, end: 400).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startTextFieldAnimation() {
    setState(() {
      _showTextFields = true;
    });
    _animationController.forward();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
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
              child: AnimatedBuilder(
                animation: _heightAnimation,
                builder: (context, child) {
                  return BlocConsumer<AuthBloc, AuthBlocState>(
                    listener: (context, state) {
                      logIt().d(
                        "Bloc listener:Login state: ${state.loginResult}",
                      );
                      if (state.loginResult is LoginSuccess) {
                        // context.goNamed(AppRoute.home.name);
                      }
                    },
                    builder: (context, state) => FormBuilder(
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
                        height: _heightAnimation.value,
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
                              if (state.loginResult is LoginFailure)
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
                                    l10n.loginError,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),

                              if (state.loginResult is LoginSuccess)
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .extension<DesignColors>()!
                                        .cardSuccessColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    l10n.loginSuccessful,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),

                              if (_showTextFields)
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
                                    FormBuilderTextField(
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                          errorText: l10n.passwordProvideValid,
                                        ),
                                      ]),
                                      name: "password",
                                      obscureText: _obscurePassword,
                                      decoration: InputDecoration(
                                        hintText: l10n.password,
                                        filled: true,
                                        fillColor: Colors.white,

                                        suffixIcon: IconButton(
                                          onPressed: _togglePasswordVisibility,
                                          icon: Icon(
                                            _obscurePassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              if (_showTextFields) ...[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      logIt().d("Forgot password clicked");
                                      context.pushNamed(
                                        '/${AppRoute.forgotPassword.name}',
                                      );
                                    },
                                    child: Text(
                                      l10n.forgotPassword,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ],

                              Column(
                                spacing: 16,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_showTextFields == false) {
                                        _startTextFieldAnimation();
                                        return;
                                      }
                                      if (_formKey.currentState!
                                          .saveAndValidate()) {
                                        final formData =
                                            _formKey.currentState!.value;

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
                                          l10n.login,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Theme.of(
                                        context,
                                      ).primaryColor,
                                      shadowColor: Colors.transparent,
                                      side: BorderSide(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                        width: 1,
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 45,
                                      child: Center(
                                        child: Text(
                                          l10n.signup,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurface,
                                              ),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
