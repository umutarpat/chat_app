import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: size.height * 0.7,
          ),
          Expanded(
            child: Card(
              child: Container(
                padding: EdgeInsets.all(0),
                width: double.infinity,
                color: Colors.green,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Log in",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Sign up")),
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
