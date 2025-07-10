import 'package:chat_app/modules/auth/application/auth_bloc.dart';
import 'package:chat_app/modules/auth/application/auth_bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _showTextFields = false;
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;
  final Color _cardColor = Color.fromARGB(255, 232, 235, 240);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(SetupEvent());

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

  void _onLoginPressed() {
    setState(() {
      _showTextFields = true;
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _cardColor,
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
                  return Container(
                    decoration: BoxDecoration(
                      color: _cardColor,
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
                        children: [
                          if (_showTextFields)
                            Column(
                              spacing: 16,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          SizedBox(height: 16),
                          Column(
                            spacing: 16,
                            children: [
                              ElevatedButton(
                                onPressed: _onLoginPressed,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: Center(
                                    child: Text(
                                      "Log in",
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
                                      "Sign up",
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
