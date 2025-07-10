import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 235, 240),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.all(0),
              width: double.infinity,
              height: 400,
              child: Padding(
                padding: const EdgeInsets.only(left: 48, right: 48, top: 48),
                child: Column(
                  mainAxisSize: MainAxisSize.max,

                  children: [
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
                          onPressed: () {},
                          child: SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: Center(
                              child: Text(
                                "Log in",
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,

                            shadowColor: Colors.transparent,
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1,
                            ),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: Center(
                              child: Text(
                                "Sign up",
                                style: Theme.of(context).textTheme.titleMedium!
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
        ],
      ),
    );
  }
}
